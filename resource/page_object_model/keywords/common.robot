*** Settings ***
Documentation       File with common keyword for starting

*** Keywords ***  
Connect to Emulator
    [Documentation]                 Basic connections to android emulator
    set appium timeout                                                  10 seconds
    Open Application                ${APPIUM_SERVER}
    ...                             platformName=${PLATFORM}
    ...                             app=${APP_LOCATION}${APK_NAME}
    ...                             appPackage=${PACKAGE_NAME} 
    ...                             appActivity=${APP_MAIN_ACTIVITY} 
    ...                             noReset=${RESET_OFF}
    ...                             fullReset=${FULL_RESET_ON} 

Set user
    [Documentation]                         We set up user for test. After we try to find him in database and delete it.
    [Arguments]                             ${user_name}
    Import Resource                         ${ROOT_USERS}${/}${user_name}.resource    

Click to Element
    [Documentation]                     Support keyword. Keyword combine two basic keyword to one. 
    [Arguments]                         ${element_andr}     ${wait_time}=10
    Wait Until Element Is Visible       ${element_andr}      ${wait_time}
    Click Element                       ${element_andr}

Input text to Element
    [Arguments]                         ${element}      ${text}
    Wait until element is Visible       ${element}
    Input text                          ${element}      ${text}
    Hide Keyboard

