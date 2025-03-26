from langchain_openai import ChatOpenAI
from browser_use import Agent, Browser, BrowserConfig, Controller, ActionResult
from browser_use.browser.context import BrowserContextConfig
from pydantic import SecretStr
from dotenv import load_dotenv
import asyncio
import os


# 参考 https://docs.browser-use.com/quickstart

async def main():
    load_dotenv()
    api_key = os.getenv("DEEPSEEK_API_KEY")
    # Initialize the model
    llm = ChatOpenAI(base_url='https://api.deepseek.com/v1', model='deepseek-reasoner', api_key=SecretStr(api_key))

    # Basic configuration
    config = BrowserConfig(
        headless=False,
        disable_security=True
        # wss_url="wss://your-browser-provider.com/ws"
        # cdp_url="http://localhost:9222"
        # browser_instance_path="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    )
    browser = Browser(config=config)

    # Create agent with the model
    agent = Agent(
        task="Your task here",
        llm=llm,
        use_vision=False,
        browser=browser  # Browser instance will be reused
    )

    result = await agent.run()
    print(result)
    # Manually close the browser
    await browser.close()


if __name__ == '__main__':
    asyncio.run(main())
