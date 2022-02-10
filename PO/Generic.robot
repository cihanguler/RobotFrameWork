*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections


*** Variables ***
${Shop_Page_Load}               css:.nav-link
${Error_Messege}                css:.alert-danger
${Url}                          https://rahulshettyacademy.com/loginpagePractise/
${UserName}                     rahulshettyacademy
${InvalidPasswosd}              221421342315
${ValidPasswosd}                learning
${Browser}                      chrome
${Path}                         C:../drivers/Firefox.exe
${Path2}                        C:../drivers/Chrome.exe


*** Keywords ***
#open the browser with the url
#    create webdriver    ${Browser}   executable_path=${Path}
#    go to   ${Url}

open the generic browser with the url
#    [Arguments]     ${Url}     ${Browser}
    open browser    ${Url}     ${Browser}
    maximize browser window

Close Browser Session
    close browser

wait until element is locadet in the page
    [Arguments]     ${page_locator}
    wait until element is visible       ${page_locator}