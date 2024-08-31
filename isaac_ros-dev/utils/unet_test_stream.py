# Written by Cameron Weigel with serious help from the internet
# Trained on labeled images provided by https://github.com/aatiibutt/Drivable-Road-Region-Detection-and-Steering-Angle-Estimation-Method
# Then fine-tuned on custom Cal Poly Pomona Dataset

# Will need to install pytorch, numpy, opencv and albumentations
import torch
import numpy as np
import torch.nn as nn
import cv2
import albumentations
import time


# UNET Architecture -- https://arxiv.org/abs/1505.0459
class EncoderBlock(nn.Module):        
    # Consists of Conv -> ReLU -> MaxPool
    def __init__(self, in_chans, out_chans, layers=2, sampling_factor=2, padding="same"):
        super().__init__()
        self.encoder = nn.ModuleList()
        self.encoder.append(nn.Conv2d(in_chans, out_chans, 3, 1, padding=padding))
        self.encoder.append(nn.ReLU())
        for _ in range(layers-1):
            self.encoder.append(nn.Conv2d(out_chans, out_chans, 3, 1, padding=padding))
            self.encoder.append(nn.ReLU())
        self.mp = nn.MaxPool2d(sampling_factor)
    def forward(self, x):
        #print("Encoder forward", x.shape)
        for enc in self.encoder:
            x = enc(x)
        mp_out = self.mp(x)
        return mp_out, x

class DecoderBlock(nn.Module):
    # Consists of 2x2 transposed convolution -> Conv -> relu
    def __init__(self, in_chans, out_chans, layers=2, skip_connection=True, sampling_factor=2, padding="same"):
        super().__init__()
        skip_factor = 1 if skip_connection else 2
        self.decoder = nn.ModuleList()
        self.tconv = nn.ConvTranspose2d(in_chans, in_chans//2, sampling_factor, sampling_factor)

        self.decoder.append(nn.Conv2d(in_chans//skip_factor, out_chans, 3, 1, padding=padding))
        self.decoder.append(nn.ReLU())

        for _ in range(layers-1):
            self.decoder.append(nn.Conv2d(out_chans, out_chans, 3, 1, padding=padding))
            self.decoder.append(nn.ReLU())

        self.skip_connection = skip_connection
        self.padding = padding
    def forward(self, x, enc_features=None):
        x = self.tconv(x)
        if self.skip_connection:
            if self.padding != "same":
                # Crop the enc_features to the same size as input
                w = x.size(-1)
                c = (enc_features.size(-1) - w) // 2
                enc_features = enc_features[:,:,c:c+w,c:c+w]
            x = torch.cat((enc_features, x), dim=1)
        for dec in self.decoder:
            x = dec(x)
        return x

class UNet(nn.Module):
    def __init__(self, nclass=1, in_chans=1, depth=5, layers=2, sampling_factor=2, skip_connection=True, padding="same"):
        super().__init__()
        self.encoder = nn.ModuleList()
        self.decoder = nn.ModuleList()

        out_chans = 64
        for _ in range(depth):
            self.encoder.append(EncoderBlock(in_chans, out_chans, layers, sampling_factor, padding))
            in_chans, out_chans = out_chans, out_chans*2

        out_chans = in_chans // 2
        for _ in range(depth-1):
            self.decoder.append(DecoderBlock(in_chans, out_chans, layers, skip_connection, sampling_factor, padding))
            in_chans, out_chans = out_chans, out_chans//2
        # Add a 1x1 convolution to produce final classes
        self.logits = nn.Conv2d(in_chans, nclass, 1, 1)

    def forward(self, x):
        #print("Forward shape ", x.shape)
        encoded = []
        for enc in self.encoder:
            x, enc_output = enc(x)
            encoded.append(enc_output)
        x = encoded.pop()
        for dec in self.decoder:
            enc_output = encoded.pop()
            x = dec(x, enc_output)

        # Return the logits
        #print("Logits shape ", self.logits(x).shape)
        return self.logits(x)
    


# Image transforms
transform = albumentations.Compose([
    albumentations.Resize(224, 224, always_apply=True),
    albumentations.Normalize(
            mean=[0.45734706, 0.43338275, 0.40058118],
            std=[0.23965294, 0.23532275, 0.2398498],
            always_apply=True)
])
    

if  __name__ == '__main__':
    # Width/Height of Input image
    WIDTH = 640
    HEIGHT = 480

    # Video device to capture from, 0 is usually the built in camera or first usb camera
    vid = cv2.VideoCapture(0, cv2.CAP_V4L2)
    # Setting frame size, this is important because it will dramatically affect process time
    vid.set(cv2.CAP_PROP_FRAME_WIDTH, WIDTH)
    vid.set(cv2.CAP_PROP_FRAME_HEIGHT, HEIGHT)

    # Don't store more than one image
    vid.set(cv2.CAP_PROP_BUFFERSIZE,1)
    # Font stuff if you want to add text to your visual output
    font = cv2.FONT_HERSHEY_SIMPLEX

    # Green color in BGR
    color = (0, 255, 0)
    
    # Line thickness of 9 px
    thickness = 9

    # Setting dtype as it is used a lot
    dtype = torch.float32
    # Check if CUDA enable gpu is available, otherwise use CPU
    if torch.cuda.is_available():
        device = torch.device('cuda:0')
    else:
        device = torch.device('cpu')
    print('using device:', device)

    # Model instantiation
    unet = UNet(in_chans=3, depth=3, layers=1, skip_connection=True)

    # Location of pretrained weights, in this case it is in the same directory as this file
    unet.load_state_dict(torch.load('unet.pkl'))

    # We will use sigmoid for getting our probabilities
    sigmoid = nn.Sigmoid()

    # Set to eval mode
    unet.eval()
    # If GPU is available, model will be loaded onto GPU for performance increase
    unet.to(device)
    # Don't do backprop, eval kinda handles this already
    with torch.no_grad():
        while True:
            # Used for timing process
            tic = time.perf_counter()

            # Capture frame
            ret, frame = vid.read()
            # Copy frame
            orig_frame = frame.copy()
            # Resize, color, transform based on mean and std_deviation
            orig_frame = cv2.resize(orig_frame, (224,224), interpolation = cv2.INTER_AREA)
            frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            frame = transform(image=frame)['image']
            frame = np.transpose(frame, (2, 0, 1))
            frame = torch.tensor(frame, dtype=torch.float32)
            # Put frame on GPU if available
            frame = frame.unsqueeze(0).to(device)
            # Inference
            infer = unet(frame).squeeze()
            # Get predictions in a nice format
            infer = sigmoid(infer)

            # Put back on CPU for Numpy stuff
            infer = infer.detach().cpu().numpy()
            # Only consider predictions of 50% or higher
            infer = np.where(infer >= .5, 0, 255).astype(np.uint8)

             # Generate intermediate image; use morphological closing to keep parts together
            inter = cv2.morphologyEx(infer, cv2.MORPH_CLOSE, cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5)))

            # Find largest contour in intermediate image
            cnts, _ = cv2.findContours(inter, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
            cnt = max(cnts, key=cv2.contourArea)

            # Create prediction mask
            out = np.zeros(infer.shape, np.uint8)
            cv2.drawContours(out, [cnt], -1, 255, cv2.FILLED)
            out = cv2.bitwise_and(inter, out)
            out = cv2.cvtColor(out, cv2.COLOR_GRAY2BGR)


            # Combine original image and prediction mask
            added_image = cv2.addWeighted(orig_frame,0.5,out,0.5,0)

            # Stop timing process
            toc = time.perf_counter()
            print(f"Time taken to for full process: {toc - tic:0.4f} seconds")

            # Visualize image
            cv2.imshow('road_finder', added_image)

            # Press/hold q to break
            if cv2.waitKey(50) == ord('q'):
                break


