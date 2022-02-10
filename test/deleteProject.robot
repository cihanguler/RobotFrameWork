*** Settings ***
Documentation       To verify deleted project is on lost phase and not seen on staffing tool
Library             SeleniumLibrary
Library             Collections
Library             BuiltIn
Library             ../customLibraries/SpyderXMainPageLocators.py
Resource            ../PO/SpyderXMainKeywords.robot
Test Setup          Set Screenshot Directory    Screenshot
#Test Teardown       Close Browser Session

*** Variables ***
${textOnPage}   Abdulkadir

*** Test Cases ***
To veryfiy deleting any project from the home page
    Open the browser with the url
    Verifiy succesfull login    ${textOnPage}
    Get all the project name from the plannig phase



