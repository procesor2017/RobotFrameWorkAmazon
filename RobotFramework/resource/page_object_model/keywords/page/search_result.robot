*** Settings ***
Documentation       File with for search result page

*** Keywords *** 
Find Product in Search result with loop
    [Arguments]             ${content_which_must_have}=${USER_WHICH_PRODUCT_WE_WANT}     ${id_elements}=${SEARCH_RESULT_ANDROID_VIEW}
    Sleep                   2
    Swipe Down 50
    @{elements}             Get Webelements     ${id_elements}
    FOR      ${i}    IN             @{elements}
        ${element_atr}              Get Element Attribute   ${i}     contentDescription  # content-desc 
        ${element_atr}=             Set Variable If     """${element_atr}""" == """None"""      ${EMPTY}  ${element_atr}
        ${element_atr}=             Set Variable If     """${element_atr}""" == """NoneType"""  ${EMPTY}  ${element_atr}
        IF  """${element_atr}""" != """"""
            ${element_is_ok}         Run keyword and Return Status      Element Text Must Contain    ${element_atr}      ${content_which_must_have}
            IF  ${element_is_ok} == ${TRUE}
                Click to Element        ${i}
            END
            Exit For Loop IF    ${element_is_ok} == ${TRUE}
        END
    END
    IF  ${element_is_ok} == ${FALSE}
        FAIL
    END

Control That product doesnt exists on Page
    [Arguments]                 ${element_must_have}=NOKIA    ${how_wanna_scroll_down}=5
    ${m_counter}=               Set Variable        0
    WHILE   ${m_counter}<${how_wanna_scroll_down}
        @{elements}           Get Webelements       xpath=//android.view.View[not(contains(@content-desc,"${element_must_have}"))]
        ${cnt}=                 Get Length           @{elements}
        ${element_is_ok}         Run keyword and Return Status      should be equal as numbers  ${cnt}  0
        IF  ${element_is_ok} == ${TRUE}
            Swipe Down 50
            ${m_counter}=            Evaluate     ${m_counter}+1
        ELSE
            Fail    špatnej počet  ${cnt}
        END
    END

Find Product in Search result
    [Arguments]                 ${my_product}=SAMSUNG
    Sleep                       3
    Click to Element            xpath=//android.view.View[contains(@content-desc,"${my_product}")]

Click to Filter
    Click to Element                    ${SEARCH_RESULT_FILTER}

Check if Filter has Cell Phones
    Wait Until Element is Visible       ${SEARCH_FILTER_CELL_PHONE}