*** Settings ***
Documentation  All the page objects and keywords of landing page
Library     SeleniumLibrary
Library     Collections






*** Variables ***
${Shop_Page_Load}               css:.nav-link

*** Keywords ***
Verifiy items in the Checkout page and proceed
    click element       css:button.btn-success

