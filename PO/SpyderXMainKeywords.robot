*** Settings ***
Library    SeleniumLibrary
Library     Collections

*** Variables ***

${Url}                              https://spyder.computacenter.com/qa-projectguide/
${Browser}                          Chrome
${planningPhaseProjectlist}         xpath://div[text()='Planning ']/../..//div[contains(@class,'v-card__subtitle')]
*** Keywords ***
Open the browser with the url
    open browser    ${Url}     ${Browser}
    maximize browser window
    reload page
Verifiy succesfull login
    [Arguments]     ${textOnPage}
    page should contain    ${textOnPage}


Get all the project name from the plannig phase
    wait until element is visible             ${planningPhaseProjectlist}
    ${elements_list}=     Get Webelements     ${planningPhaseProjectlist}
    log    ${elements_list}
    @{actual_list}=   Create List
    FOR  ${list}  IN  @{elements_list}
       Log   ${list.text}
       append to list    ${actual_list}  ${list.text}
    END

Close Browser Session
    close browser