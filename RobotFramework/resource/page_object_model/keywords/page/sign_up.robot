*** Settings ***
Documentation       File with common keyword for starting

*** Keywords ***  
Sign Up Enter Email
    Input text to Element   ${SIGNUP_EMAIL}         ${USER_EMAIL}

Sign Up Click To Continue
    Click to Element        ${SIGNUP_CONTINUE_BUTTON}

Sign Up Enter Password
    Input text to Element   ${SIGNUP_PASSWORD}       ${USER_PASSWORD}

Sign Up Click To Sign Up Button
    Click to Element        ${SIGNUP_BUTTON}

Sign Up Click To Not Now
    [Documentation]         Sometimes Page with pin code and telefon number wasnt loaded, so i must create statement.
    ${status}               Run keyword and Return Status       Wait Until Element is Visible       ${SIGNUP_NOT_NOW}
    IF  ${status}==${TRUE}
        Click to Element    ${SIGNUP_NOT_NOW}
    END


Sign Up User
    Sign Up Enter Email
    Sign Up Click To Continue
    Sign Up Enter Password
    Sign Up Click To Sign Up Button
    Sleep                   10
    Sign Up Click To Not Now