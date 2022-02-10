from selenium import webdriver


driver = webdriver.Firefox("../drivers/firefox.exe")
driver.get("https://google.com")