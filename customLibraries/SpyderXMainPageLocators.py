from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class SpyderXMainKeywords:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_word(self):
        print("Hello")

    @keyword
    def click_of_project(self, projectName):
        self.selLib.click_elemen("xpath://div[text()=' " + projectName + " ']/../button")
