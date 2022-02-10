*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library         ../customLibraries/WebDrivers.py
Library         ../customLibraries/Shop.py
Test Setup    Set Screenshot Directory    Screenshot

#Test Teardown     Close Browser


*** Variables ***

${Error_Messege_Login}      css:.alert-danger

*** Test Cases ***
Validate UnSuccesful Login
    open the browser with the url
#    Fill the login form
#    wait until it chechs and display error message
#    verify error messeage is correct


*** Keywords ***
open the browser with the url
   driver Manager      Edge    https://google.com
#     driver Manager    Chrome   executable_path=../drivers/chrome.exe
#    create webdriver    Firefox   executable_path=../drivers/firefox.exe
#    go to   https://rahulshettyacademy.com/loginpagePractise/



Fill the login form
    input text          id=username     rahulshettyacademy
    input password      id=password     2342321135
    click button        id=signInBtn


wait until it chechs and display error message
    wait until element is visible       css:.alert-danger

verify error messeage is correct
#    ${result} =     get text     ${Error_Messege_Login}
#    Should Be Equal As Strings    ${result}     Incorrect username/password.
    element text should be      ${Error_Messege_Login}      Incorrect username/password.


