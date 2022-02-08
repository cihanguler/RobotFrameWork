*** Settings ***
Documentation  All the page objects and keywords of landing page
Library     SeleniumLibrary
Library     Collections
Resource    Generic.robot


*** Variables ***
${Error_Messege}                css:.alert-danger


*** Keywords ***
Fill the login form
    [arguments]         ${username}     ${password}
    input text          id=username     ${username}
    input password      id=password     ${password}
    Click Button        id=signInBtn


wait until element is locadet in the page
    wait until element is visible       ${Error_Messege}

verify error messeage is correct
    ${result}=   get text    ${Error_Messege}
    Should be equal as Strings  ${result}   Incorrect username/password.
    element text should be      ${Error_Messege}      Incorrect username/password.


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