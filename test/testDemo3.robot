*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library     BuiltIn
Library     String
Test Setup          open the browser with the url
Test Teardown       Close Browser Session
Resource            ../PO/Generic.robot


*** Variables ***
${Error_Messege_Login}      css:.alert-danger

*** Test Cases ***
Validate child window functioniality
    Select link of child window
    Verify the user is switched to child window
    Grap the Email ID in the child window
    switch to parent window and enter the Email


*** Keywords ***
Select link of child window

    click element       css:.blinkingText
    sleep       5
Verify the user is switched to child window
    switch window       NEW
    element text should be      css:.inner-box      DOCUMENTS REQUEST

Grap the Email ID in the child window
   ${text}       get text    css:.red
   @{words}     split string     ${text}     at
   ${text_split}     get from list       ${words}     1
   log   ${text_split}
   @{words_2}     split string     ${text_split}     #split based on space
   ${email}     get from list       ${words_2}     0
   set global variable      ${email}


switch to parent window and enter the Email
    switch window   MAIN
    title should be     LoginPage Practise | Rahul Shetty Academy
    input text          id=username     ${email}




