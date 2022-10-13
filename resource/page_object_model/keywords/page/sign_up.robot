*** Settings ***
Documentation       File with common keyword for starting

*** Keywords ***  
Sign Up Enter Email
    Input text to Element   ${SIGNUP_EMAIL}         ${USER_EMAIL}

Sign Up Click To Continue
    Click to Element        ${SIGNUP_CONTINUE_BUTTON}

Sign Up Enter Password
    Input text to Element   ${SIGNUP_PASSWORD}       ${USER_PASSWORD}

Sign Up User
    Sign Up Enter Email
    Sign Up Click To Continue