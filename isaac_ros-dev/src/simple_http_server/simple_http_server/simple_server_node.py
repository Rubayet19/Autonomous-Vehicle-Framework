import asyncio
from aiohttp import web
import rclpy
from rclpy.node import Node

class SimpleHTTPServerNode(Node):
    def __init__(self):
        super().__init__('simple_http_server_node')
        self.get_logger().info("Initializing SimpleHTTPServerNode... :)")

        # Create and set up an asyncio event loop
        self.loop = asyncio.new_event_loop()
        asyncio.set_event_loop(self.loop)
        
        self.http_server_task = self.loop.create_task(self.start_http_server())

    async def start_http_server(self):
        try:
            app = web.Application()
            app.router.add_get('/', self.handle_request)
            runner = web.AppRunner(app)
            await runner.setup()
            site = web.TCPSite(runner, '0.0.0.0', 8082)
            await site.start()
            self.get_logger().info("HTTP server running on http://0.0.0.0:8082")
        except Exception as e:
            self.get_logger().error(f"Failed to start HTTP server: {e}")

    async def handle_request(self, request):
        self.get_logger().info("Received request")
        return web.Response(text="I am inside http server ros2 node!")

    def destroy_node(self):
        if self.http_server_task:
            self.get_logger().info("Cancelling HTTP server task")
            self.http_server_task.cancel()
            try:
                self.loop.run_until_complete(self.http_server_task)
            except asyncio.CancelledError:
                self.get_logger().info("HTTP server task was cancelled")
        super().destroy_node()

def main(args=None):
    rclpy.init(args=args)
    node = SimpleHTTPServerNode()

    try:
        # Run the ROS 2 spin and asyncio loop together
        while rclpy.ok():
            rclpy.spin_once(node)
            # Allow asyncio to process events
            node.loop.run_until_complete(asyncio.sleep(0.01))
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
