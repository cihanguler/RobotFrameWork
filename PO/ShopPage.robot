*** Settings ***
Documentation  All the page objects and keywords of landing page
Library     SeleniumLibrary
Library     Collections



*** Variables ***
${Shop_Page_Load}               css:.nav-link

*** Keywords ***
wait until element is locadet in the page
    wait until element is visible       ${Shop_Page_Load}


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



