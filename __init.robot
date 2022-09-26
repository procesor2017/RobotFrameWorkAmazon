***Settings***
Documentation       File for settings robot framework (Imports, ROOT folder etc.)
Library             AppiumLibrary
Library             Collections
Library             String

*** Variables ***
# General Variables
${PLATFORM}                 Android


*** Keywords ***
Init
    [Documentation]             Most important file in folder. There you set up path, platform, language etc.
    ...                         Every resource or robot file must be here under Import resource.
    # Set Global Path
    Set Global Variable         ${ROOT}                     ${CURDIR}
    Set Global Variable         ${ROOT_KEYWORDS_MOBILE}     ${ROOT}${/}resource${/}page_object_model${/}keywords
    Set Global Variable         ${ROOT_USERS}               ${ROOT}${/}resource${/}test_data${/}users
    Set Global Variable         ${ROOT_VARIABLES_MOBILE}    ${ROOT}${/}resource${/}page_object_model${/}variables

    # Set App path
    Set Global Variable     ${APK_NAME}                 amazon-shopping.apk
    Set Global Variable     ${APP_LOCATION}             ${ROOT}${/}resource${/}test_data${/}application${/}

  # Import resource For Mobile
    # -----------   Keywords ------------------
    Import resource         ${ROOT_KEYWORDS_MOBILE}${/}common.robot

    # Page
    Import resource         ${ROOT_KEYWORDS_MOBILE}${/}page${/}login.robot
    Import resource         ${ROOT_KEYWORDS_MOBILE}${/}page${/}dashboard.robot

    # Component
    Import resource         ${ROOT_KEYWORDS_MOBILE}${/}components${/}search_bar.robot



    # -----------   Variables ------------------
    Import resource         ${ROOT_VARIABLES_MOBILE}${/}common.resource

    # Page
    Import resource         ${ROOT_VARIABLES_MOBILE}${/}page${/}login.resource
    Import resource         ${ROOT_VARIABLES_MOBILE}${/}page${/}dashboard.resource

    # Component
    Import resource         ${ROOT_VARIABLES_MOBILE}${/}components${/}search_bar.resource