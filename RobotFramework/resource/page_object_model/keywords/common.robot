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
    ...                             fullReset=${FULL_RESET_ON}
    ...                             noReset=${RESET_OFF}
    ...                             newCommandTimeout=${NEW_COMMAND_TIMEOUT}
    ...                             platformVersion=${platformVersion}
    ...                             deviceName=${deviceName}
    ...                             automationName=${automationName}
    ...                             unicodeKeyboard=${unicodeKeyboard}
    ...                             resetKeyboard=${resetKeyboard}
    ...                             udid=${udid}
    ...                             enableMultiWindows=${TRUE}


Connect to Emulator 2
    set appium timeout                                                  10 seconds
    Open Application                ${APPIUM_SERVER}
    ...                             platformName=${PLATFORM}
    ...                             app=${APP_LOCATION}${APK_NAME}
    ...                             appPackage=${PACKAGE_NAME} 
    ...                             appActivity=${APP_MAIN_ACTIVITY}
    ...                             newCommandTimeout=${NEW_COMMAND_TIMEOUT}
    ...                             skipDeviceInitialization=${skipDeviceInitialization}
    ...                             skipServerInstallation=${skipServerInstallation}
    ...                             noReset=${RESET_ON}
    ...                             enableMultiWindows=${TRUE}
    Reset Application

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

SSwipe down Find Element by contentDescription
    [Arguments]             ${id_elements}    ${text_should_contain}    ${how_wanna_scroll_down}=5
    ${m_counter}=             Set Variable        0
    WHILE   ${m_counter}<${how_wanna_scroll_down}
        sleep                 5
        ${element_find}       Run Keyword And Return Status   Get Webelements     ${id_elements}
        IF  ${element_find}==${TRUE}
            @{elements}     Get Webelements     ${id_elements}
            FOR      ${i}    IN                 @{elements}
                ${element_text}                 Get Element Attribute   ${i}     contentDescription  # content-desc 
                ${element_is_ok}                Run Keyword And Return Status      Should Be Equal As Strings  ${element_text}    ${text_should_contain}
                IF  ${element_is_ok}==${TRUE}
                    Click to Element            ${i}
                    BREAK
                END
            END
        ELSE
            Set Test Variable       ${element_is_ok}    ${FALSE}
        END
        IF  ${element_is_ok}==${TRUE}
            BREAK
        END
        Swipe Down 50
        ${m_counter}=            Evaluate     ${m_counter}+1
        IF  ${m_counter}<${how_wanna_scroll_down}
            Log                 End Loop
        ELSE
            Fail                Element Wasn Found
        END
    END    

Find Element on Page
    [Documentation]                     In Some case, appium try to find element, which is on page but appium doesnt see it. (Hi resource-id)
    ...                                 In these case we use this keyword with class=<element class> and text which element contains.
    [Arguments]                         ${id_elements}    ${text_should_contain}
    ${element_find}       Run Keyword And Return Status   Get Webelements     ${id_elements}
    IF  ${element_find}==${TRUE}
        @{elements}     Get Webelements     ${id_elements}
        FOR      ${i}    IN                 @{elements}
            ${element_text}                 Get Text        ${i}  
            ${element_is_ok}                Run Keyword And Return Status      Should Be Equal As Strings  ${element_text}    ${text_should_contain}
            IF  ${element_is_ok}==${TRUE}
                BREAK
            END
        END
    ELSE
        Set Test Variable       ${element_is_ok}    ${FALSE}
    END
    
    IF  ${element_is_ok}==${TRUE}
        Log             """${id_elements}""" exists on page.
    ELSE
        Capture Page Screenshot
        FAIL        Element """${id_elements}""" isnt exists on page.
    END

Element Text Must Be
    [Documentation]                     Check that element text is valid
    ...                                 For right works u need specific element ID
    ...                                 Text is convert to lowercase, withou special char and space
    [Arguments]                         ${element_text}           ${text}
    # Wait Until Element is Visible       ${element_id}               15
    # ${element_text}                     Get Text                    ${element_id} 
    ${element_text_lower_case}          Convert To Lowercase    ${element_text}
    ${text_lower_case}                  Convert To Lowercase    ${text}
    Set Test Variable                   ${clear_element_text}   ${element_text_lower_case.replace("\n", " ").replace(" ", "")}
    Set Test Variable                   ${clear_your_text}      ${text_lower_case.replace("\\n", " ").replace("\n", " ").replace(" ", "")}
    Should Be Equal As Strings          ${clear_element_text}   ${clear_your_text}  

Element Text Must Contain
    [Documentation]                     Check that element text is contain valid text
    ...                                 For right works u need specific element ID
    [Arguments]                         ${element_text}               ${text}
    # Wait Until Element is Visible       ${element_id}               15
    # ${element_text}                     Get Text                    ${element_id}  
    ${element_text_lower_case}          Convert To Lowercase        ${element_text}
    ${text_lower_case}                  Convert To Lowercase        ${text}
    Set Test Variable                   ${clear_element_text}       ${element_text_lower_case.replace("\n", " ").replace(" ", "")}
    Set Test Variable                   ${clear_your_text}          ${text_lower_case.replace("\\n", " ").replace("\n", " ").replace(" ", "")}
    Should Contain                      ${clear_element_text}       ${clear_your_text}  

Swipe Down and Find Element
    [Arguments]                 ${id_elements}      ${how_wanna_scroll_down}=5
    ${m_counter}=               Set Variable        0
    ${element_exists}           Run Keyword And Return Status   Get Webelements     ${id_elements}
    IF  ${element_exists}==${FALSE}
        WHILE   ${m_counter}<${how_wanna_scroll_down}
            Sleep                   2
            ${element_find}         Run Keyword And Return Status   Get Webelements     ${id_elements}
            IF  ${element_find}==${TRUE}
                Click to Element            ${id_elements}
                BREAK  
            ELSE
                Swipe Down 50
                ${m_counter}=            Evaluate     ${m_counter}+1
                IF  ${m_counter}<${how_wanna_scroll_down}
                    Log                 End Loop
                ELSE
                    Fail                Element Wasn Found
                END
            END
        END
    ELSE
        Click to Element            ${id_elements}
    END
