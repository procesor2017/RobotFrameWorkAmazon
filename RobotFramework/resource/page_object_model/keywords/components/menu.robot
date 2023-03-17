*** Settings ***
Documentation       File with common keyword for works with menu bar

*** Keywords ***
Click to Cart in Menu
    Click to Menu Button    ${MENU_CART_ICON}

Click to Menu Button
    [Arguments]             ${content_which_must_have}    ${id_elements}=${MENU_IMAGE_VIEW}
    Sleep                   1
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

Click To Video
    Swipe down Find Element     ${MENU_VIDEO}   ${MENU_VIDEO_TEXT}      1