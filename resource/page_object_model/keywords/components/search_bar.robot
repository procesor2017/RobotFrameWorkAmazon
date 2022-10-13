*** Settings ***
Documentation       File with common keyword for works with search bar

*** Keywords ***  
Check if Search Bar Exists
    Wait Until Element is Visible      ${SEARCH_BAR_HINT_VIEW}

Find Product
    [Arguments]                     ${product}      
    Click to Element                ${SEARCH_BAR_HINT_VIEW}
    Input text to Element           ${SEARCH_BAR_INPUT}     ${product}
    # Sometime we dont load search offer so i must press enter
    # Wait Until Element is Visible   ${SEARCH_ELEMENT_WITH_SEARCH_OFFER}
    # Tap                             ${SEARCH_ELEMENT_WITH_SEARCH_OFFER}
    Press Keycode                   66
    Log                             Tapnuto