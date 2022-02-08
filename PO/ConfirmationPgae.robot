*** Settings ***
Documentation  All the page objects and keywords of landing page
Library     SeleniumLibrary
Library     Collections
Library     BuiltIn
Resource    Generic.robot



*** Variables ***
${Shop_Page_Load}               css:.nav-link
${county_location}              //a[text()='India']

*** Keywords ***
Enter the Country and select the terms
    [arguments]     ${country_name}
    input text      country     ${country_name}
    sleep   3s
    Generic.wait until element is locadet in the page  //a[text()='${country_name}']
    click element   //a[text()='${country_name}']
    click element   css:.checkbox label


Purchase the product and confirm the purchase
    click button    css:.btn-success
    page should contain     Success!
