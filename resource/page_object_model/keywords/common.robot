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
    ...                             newCommandTimeout=${NEW_COMMAND_TIMEOUT}


Set user
    [Documentation]                         We set up user for test. After we try to find him in database and delete it.
    [Arguments]                             ${user_name}
    Import Resource                         ${ROOT_USERS}${/}${user_name}.resource    

Click to Element
    [Documentation]                     Support keyword. Keyword combine two basic keyword to one. 
    [Arguments]                         ${element_andr}     ${wait_time}=15
    Wait Until Element Is Visible       ${element_andr}     ${wait_time}
    Click Element                       ${element_andr}

Input text to Element
    [Arguments]                         ${element}      ${text}
    Wait until element is Visible       ${element}
    Input text                          ${element}      ${text}
    # Hide Keyboard                     Commented because if u hide keyboard amazone return you back

Swipe Down 50
    Swipe by Percent        50  50  50  0  

Swipe Down 100
    Swipe by Percent        50  50  50  -50 

Swipe up 100
    Swipe by Percent        50  50  50  150

Swipe down Find Element
    [Arguments]             ${id_elements}      ${how_wanna_scroll_down}=3
    ${m_counter}=             Set Variable        0
    WHILE   ${m_counter}<${how_wanna_scroll_down}
        ${element_exists}       Run Keyword And Return Status   Page Should Contain Element      ${id_elements}
        ${ele}                  Run Keyword And Return Status   Get Webelements     ${id_elements}
        IF  ${ele} == ${TRUE}
            Log to Console          Element Exists from web ele!
        END
  
        IF  ${element_exists} == ${TRUE}
            Log to Console          Element Exists!
            BREAK
        ELSE
            Swipe Down 100
            ${m_counter}=            Evaluate     ${m_counter}+1
        END
    END
