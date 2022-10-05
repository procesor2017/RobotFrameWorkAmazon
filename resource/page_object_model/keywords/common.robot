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
    [Arguments]             ${id_elements}    ${text_should_contain}    ${how_wanna_scroll_down}=2
    ${m_counter}=             Set Variable        0
    WHILE   ${m_counter}<${how_wanna_scroll_down}
        sleep                 5
        ${element_find}       Run Keyword And Return Status   Get Webelements     ${id_elements}
        IF  ${element_find}==${TRUE}
            @{elements}     Get Webelements     ${id_elements}
            FOR      ${i}    IN                 @{elements}
                ${element_text}                 Get Text        ${i}  
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
        Swipe Down 100
        ${m_counter}=            Evaluate     ${m_counter}+1
    END



Swipe down Find Element old
    [Arguments]             ${id_elements}    ${how_wanna_scroll_down}=3
    ${m_counter}=             Set Variable        0
    WHILE   ${m_counter}<${how_wanna_scroll_down}
        ${element_exists}       Run Keyword And Return Status   Page Should Contain Element         id=${id_elements}
        IF   ${element_exists}==${TRUE}
            Log To Console       Ahoj
        ELSE
            ${source}                 Get Source
            Log                     ${source}
            ${element_find}       Run Keyword And Return Status   Get Webelements     id=${id_elements}
            IF  ${element_find}==${TRUE}
                @{find_ele}         Get Webelements     id=${id_elements} 
                FOR     ${i}    IN      @{find_ele}
                    Log     ${i}
                END
            ELSE
                Log     hovno
            END
        END
        Swipe Down 100
        ${m_counter}=            Evaluate     ${m_counter}+1
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