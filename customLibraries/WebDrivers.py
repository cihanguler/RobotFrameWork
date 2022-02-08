
from robot.api.deco import library, keyword
from webdriver_manager.microsoft import EdgeChromiumDriverManager
from webdrivermanager import GeckoDriverManager
from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from webdriver_manager.firefox import GeckoDriverManager
import time
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
            driver = webdriver.Chrome("../drivers/chrome.exe")
            driver.maximize_window()
            driver.get(url)
            time.sleep(2)
            driver.close()
