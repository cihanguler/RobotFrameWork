*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library     BuiltIn
Test Setup          open the browser with the url
Test Teardown       Close Browser Session
Resource            ../PO/Generic.robot


*** Test Cases ***
Validate UnSuccesful Login
    Fill the login form                             ${UserName}     ${InvalidPasswosd}
    wait until element is locadet in the page       ${Error_Messege}
    verify error messeage is correct

Validate Cards display in the Shoping Page
    Fill the login form                              ${UserName}  ${ValidPasswosd}
    wait until element is locadet in the page       ${Shop_Page_Load}
    Verfiy Card titles in the shop page
    Select the Card     Blackberry

Select the form and navigate to Child window
    Fill the Login details and login form

*** Keywords ***
Fill the login form
    [Arguments]         ${username}     ${password}
    input text          id=username     ${username}
    input password      id=password     ${password}
    Click Button        id=signInBtn

wait until element is locadet in the page
    [Arguments]     ${WebElement}
    wait until element is visible       ${WebElement}

verify error messeage is correct
    element text should be      ${Error_Messege}      Incorrect username/password.

Verfiy Card titles in the shop page
    @{expected_list}=   Create List     iphone X     Samsung Note 8      Nokia Edge      Blackberry
    ${elements_list}=     Get Webelements     css:.card-title
    @{actual_list}=   Create List
    FOR  ${list}  IN  @{elements_list}
       Log   ${list.text}
       Append To List   ${actual_list}  ${list.text}
    END
    lists should be equal   ${expected_list}    ${actual_list}

Select the Card
    [Arguments]     ${cardName}
    ${elements_list}=     Get Webelements     css:.card-title
    ${index}=   Set Variable    1
    FOR  ${list}  IN    @{elements_list}
        Exit For Loop If    '${cardName}' == '${list.text}'
        ${index}=   Evaluate   ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

#robot testDemo2.robot
Fill the Login details and login form

    input text          id=username     rahulshettyacademy
    input password      id=password     learning
    click element       xpath:(//*[@class='checkmark'])[2]   #input[value='user']
    wait until element is visible       css:.modal-body
    click button       okayBtn
    wait until element is not visible        css:.modal-body
    select from list by value       css:select.form-control     stud
    select checkbox     terms
    checkbox should be selected     terms