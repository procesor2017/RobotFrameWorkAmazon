*** Settings ***
Documentation       File with common keyword for starting

*** Keywords ***  
Skip Login
    Click to Done in Amazon is WorldWide
    Click to Element                        ${LOGIN_SKIP_LOGIN_BUTTON}    

Click To Login
    Click to Element                        ${LOGIN_LOGIN_BUTTON}
