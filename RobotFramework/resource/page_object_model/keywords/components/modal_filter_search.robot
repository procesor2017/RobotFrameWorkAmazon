*** Settings ***
Documentation       File with common keyword for works with modal window. Win shows up after click to filter under searchbar

*** Keywords *** 
Filter Click to Cell Phones
    Click to Element    ${MODAL_FILTER_SEARCH_CELL_PHONES}

Filter Click to Brand Samsung
    Click to Element    ${MODAL_FILTER_SEARCH_BRAND_SAMSUNG} 

Filter Show Results
    ${was_clicked}      Run Keyword and Return Status       Click to Element    ${MODAL_FILTER_SHOW_RESULTS}
    IF  ${was_clicked}==${FALSE}
        @{elements}             Get Webelements     ${SEARCH_RESULT_ANDROID_VIEW}
        FOR      ${i}    IN             @{elements}
            ${element_atr}              Get Element Attribute   ${i}     contentDescription  # content-desc 
            ${element_atr}=             Set Variable If     """${element_atr}""" == """None"""      ${EMPTY}  ${element_atr}
            ${element_atr}=             Set Variable If     """${element_atr}""" == """NoneType"""  ${EMPTY}  ${element_atr}
            IF  """${element_atr}""" != """"""
                ${element_is_ok}         Run keyword and Return Status      Should Contain    ${element_atr}     ${MODAL_FILTER}  
                IF  ${element_is_ok} == ${TRUE}
                    Click to Element        ${i}
                END
                Exit For Loop IF    ${element_is_ok} == ${TRUE}
            END
        END
        IF  ${element_is_ok} == ${FALSE}
            FAIL
        END
    END
    
Better Filter Show Results
    [Arguments]                 ${text_contain}
    Click to Element            xpath=//android.widget.TextView[contains(@text,"${text_contain}")]

Filter Use filter and show Results
    Filter Click to Cell Phones
    New Filter Show Results