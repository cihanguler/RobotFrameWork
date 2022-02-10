
from robot.api.deco import library, keyword
from webdriver_manager.microsoft import EdgeChromiumDriverManager
from webdrivermanager import GeckoDriverManager
from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import logging




@library
class WebDrivers:

    @keyword
    def driver_Manager(self, browser, url):

        if browser == "Firefox":
            driver = webdriver.Firefox(service=Service(GeckoDriverManager().install()))
            driver.maximize_window()
            driver.get(url)
            time.sleep(2)
            driver.close()

        elif browser == "Edge":
            driver = webdriver.Edge(service=Service(EdgeChromiumDriverManager(log_level=20).install()))
            driver.maximize_window()
            driver.get(url)
            time.sleep(2)
            driver.close()

        elif browser == "Chrome":
            chrome_options = Options()
            chrome_options.add_argument('--headless')
            chrome_options.add_argument('--no-sandbox')
            chrome_options.add_argument('--disable-dev-shm-usage')
            d = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
            d.get(url)

            time.sleep(2)
            d.close()
