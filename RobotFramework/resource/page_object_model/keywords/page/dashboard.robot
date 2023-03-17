*** Settings ***
Documentation       File with common keyword for dashboard

*** Keywords ***  
Dashboard - Find My Product
    Find Product                    ${USER_WHICH_PRODUCT_WE_WANT}

Dashboard - Check Loaded
    Check if Search Bar Exists 