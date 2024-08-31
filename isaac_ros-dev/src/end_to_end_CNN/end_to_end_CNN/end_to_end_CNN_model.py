import torch
import numpy as np
import torch.nn as nn
import torch.nn.functional as F

# Written by our Master Student
# Credit: https://github.com/Jal-E/Autonomous-Vehicle/blob/main/EndtoEnd_CNN.ipynb

class SelfDrivingCarCNN(nn.Module):
    def __init__(self):
        super(SelfDrivingCarCNN, self).__init__()
        
        # Normalization layer (not learned, implemented in forward pass)
        
        # Five Convolutional Layers(to identify features from images)
        self.conv1 = nn.Conv2d(3, 24, kernel_size=5, stride=2)
        self.conv2 = nn.Conv2d(24, 36, kernel_size=5, stride=2)
        self.conv3 = nn.Conv2d(36, 48, kernel_size=5, stride=2)
        self.conv4 = nn.Conv2d(48, 64, kernel_size=3, stride=1)
        self.conv5 = nn.Conv2d(64, 64, kernel_size=3, stride=1)

        self.dropout = nn.Dropout(p=0.5)
        
        # Fully Connected Layers(to understand features and make decisions)
        self.fc1 = nn.Linear(1152, 100)
        self.fc2 = nn.Linear(100, 50)
        self.fc3 = nn.Linear(50, 10)
        self.fc4 = nn.Linear(10, 1)
    
    def forward(self, x):
        # Apply Convolutional Layers with ReLU activations(feature identification layers)
        x = F.relu(self.conv1(x))
        x = F.relu(self.conv2(x))
        x = F.relu(self.conv3(x))
        x = F.relu(self.conv4(x))
        x = F.relu(self.conv5(x))
        
        print('Shape after conv5:', x.shape)

        # Flatten the tensor(for decision-making layers)
        x = x.view(x.size(0), -1)
        print('Shape after flattening:', x.shape)
        
        # Apply Fully Connected Layers with ReLU activations(the decision-making layers)
        x = self.dropout(x)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        x = self.fc4(x)
        
        return x

model = SelfDrivingCarCNN()
dummy_input = torch.randn(1, 3, 66, 200)  
output = model(dummy_input)
print("Output shape:", output.shape)
