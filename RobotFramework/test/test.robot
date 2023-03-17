***Settings***
Documentation       Common TC
Resource            ${CURDIR}${/}..${/}__init.robot
Suite Setup         Init

***Test Cases***
TC1 :: Find Product
    [Documentation]                 done
    [Tags]                          
    Connect to Emulator 2             
    Set user                        common_user
    Skip Login
    Dashboard - Find My Product

TC2 ::Adding goods to the shopping cart
    [Documentation]                 done
    [Tags]                          
    Connect to Emulator             
    Set user                        common_user
    Skip Login
    Dashboard - Find My Product
    Sleep                           3
    Dashboard - Find My Product
    Find Product in Search result   
    Add to Cart

TC3 :: Filter
    [Documentation]                 Done     
    [Tags]                          2               
    Connect to Emulator
    Set user                        filter_user
    Skip Login
    Dashboard - Find My Product
    Sleep                           3
    Dashboard - Find My Product
    Click to Filter
    Filter Use filter and show Results

TC4 :: Category - Video Sports
    [Tags]                     
    Connect to Emulator
    Set user                        filter_user
    Skip Login
    Click To Video
    Find TV Channel

TC5 :: Login
    [Tags]                     
    Connect to Emulator
    Set user                        login_user
    Click To Login
    Sign Up User
    Dashboard - Check Loaded