*** Settings ***
Documentation       File with for search result page

*** Keywords *** 
Find Product in Search result
    [Arguments]             ${content_which_must_have}=${USER_WHICH_PRODUCT_WE_WANT}     ${id_elements}=${SEARCH_RESULT_ANDROID_VIEW}
    Sleep                   5
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

Click to Filter
    Click to Element                    ${SEARCH_RESULT_FILTER}


Check if Filter has Cell Phones
    Wait Until Element is Visible       ${SEARCH_FILTER_CELL_PHONE}