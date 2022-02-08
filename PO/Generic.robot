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
${Browser}                      Firefox
${Path}                         C:../drivers/Firefox.exe
${Path2}                        C:../drivers/Chrome.exe


*** Keywords ***
open the browser with the url
    create webdriver    ${Browser}   executable_path=${Path}
    go to   ${Url}

open the generic browser with the url
    [arguments]     ${browser_name}
    create webdriver    ${browser_name}   executable_path=../drivers/${browser_name}.exe
    go to   ${Url}

Close Browser Session
    close browser

wait until element is locadet in the page
    [arguments]     ${page_locator}
    wait until element is visible       ${page_locator}