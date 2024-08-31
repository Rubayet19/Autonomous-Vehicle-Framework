import asyncio
from aiohttp import web

async def handle_request(request):
    return web.Response(text="Hello from asyncio server!")

async def start_http_server():
    try:
        app = web.Application()
        app.router.add_get('/', handle_request)
        runner = web.AppRunner(app)
        await runner.setup()
        site = web.TCPSite(runner, '0.0.0.0', 8082)
        await site.start()
        print("HTTP server running on http://0.0.0.0:8082")
    except Exception as e:
        print(f"Failed to start HTTP server: {e}")

async def main():
    print("Starting event loop...")
    await start_http_server()
    while True:
        await asyncio.sleep(3600)  # Keep the server running

if __name__ == '__main__':
    asyncio.run(main())
