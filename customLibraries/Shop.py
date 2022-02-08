from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from webdrivermanager import GeckoDriverManager

@library
class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_word(self):
        print("Hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productList):
        i = 1
        productsTitles = self.selLib.get_webelements("css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productList:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
            i = i + 1


        self.selLib.click_link("css:li.active a")

    def wed_driver_manager(self):
        gdd = GeckoDriverManager()
        gdd.download_and_install()
