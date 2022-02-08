*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library     BuiltIn

Library         ../customLibraries/Shop.py
Test Setup          open the generic browser with the url    Chrome
#Test Setup          open the browser with the url
Suite Setup
Suite Teardown
Test Teardown       Close Browser Session
Resource            ../PO/Generic.robot
Resource            ../PO/LandingPage.robot
Resource            ../PO/ShopPage.robot
Resource            ../PO/CheckoutPage.robot
Resource            ../PO/ConfirmationPgae.robot
*** Variables ***

@{listofProducts}               Blackberry      Nokia Edge
${country_name}                 India
*** Test Cases ***
Validate UnSuccesful Login
    LandingPage.Fill the login form                             ${UserName}  ${InvalidPasswosd}
    LandingPage.wait until element is locadet in the page
    LandingPage.verify error messeage is correct

Validate Cards display in the Shoping Page
    LandingPage.Fill the login form                              ${UserName}  ${ValidPasswosd}
    ShopPage.wait until element is locadet in the page
    ShopPage.Verfiy Card titles in the shop page
    add items to cart and checkout      ${listofProducts}
    CheckoutPage.Verifiy items in the Checkout page and proceed
    ConfirmationPgae.Enter the Country and select the terms       ${country_name}
    ConfirmationPgae.Purchase the product and confirm the purchase

    #Select the Card     Blackberry

Select the form and navigate to Child window
    LandingPage.Fill the Login details and login form







