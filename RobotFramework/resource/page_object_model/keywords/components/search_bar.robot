*** Settings ***
Documentation       File with common keyword for works with search bar

*** Keywords ***  
Check if Search Bar Exists
    Sleep                              2        # must be, without is drop on StaleElementReferenceException: Message: Cached elements
    Wait Until Element is Visible      ${SEARCH_BAR_HINT_VIEW}      timeout=60

Find Product
    [Arguments]                     ${product}      
    Click to Element                ${SEARCH_BAR_HINT_VIEW}
    Input text to Element           ${SEARCH_BAR_INPUT}     ${product}
    Press Keycode                   66
    Log                             Tapnuto