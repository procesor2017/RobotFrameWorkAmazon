*** Settings ***
Documentation       File with common keyword for works with search bar

*** Keywords ***  
Check if Search Bar Exists
    Wait Until Element is Visible       ${SEARCH_BAR_INPUT}

Find Product
    [Arguments]                 ${product}
    Click to Element            ${SEARCH_BAR_HINT_VIEW}
    Input text to Element       ${SEARCH_BAR_INPUT}     ${product}
    Click to Element            ${SEARCH_BAR_SEARCH_ICON}