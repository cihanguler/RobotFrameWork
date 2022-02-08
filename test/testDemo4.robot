*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Teardown     Close Browser
Test Template     Validate UnSuccesful Login

#Resource

*** Variables ***

${Error_Messege_Login}      css:.alert-danger

*** Test Cases ***      username        password
Invalid username        dsaded          learning
Valid password          rahulshetty     3423
Special characters      ²@34            learning


*** Keywords ***
Validate UnSuccesful Login
    [Arguments]     ${username}     ${password}
    open the browser with the url
    Fill the login form     ${username}     ${password}
    wait until it chechs and display error message
    verify error messeage is correct

open the browser with the url
#    create webdriver    Chrome   executable_path=C:/Users/AAKYURT/PycharmProjects/RobotFrameWork/drivers/ddd.exe
    create webdriver    Firefox   executable_path=C:/Users/AAKYURT/PycharmProjects/RobotFrameWork/drivers/geckodriver.exe
    go to   https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
     [arguments]         ${username}     ${password}
    input text          id=username     ${username}
    input password      id=password     ${password}
    Click Button        id=signInBtn


wait until it chechs and display error message
    wait until element is visible       css:.alert-danger

verify error messeage is correct
#    ${result} =     get text     ${Error_Messege_Login}
#    Should Be Equal As Strings    ${result}     Incorrect username/password.
    element text should be      ${Error_Messege_Login}      Incorrect username/password.


