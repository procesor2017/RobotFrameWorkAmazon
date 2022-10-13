***Settings***
Documentation       Common TC
Resource            ${EXECDIR}/__init.robot
Suite Setup         Init


***Test Cases***
TC1 :: POC
    [Documentation]                 done
    [Tags]                          2
    Connect to Emulator 2             
    Set user                        common_user
    Skip Login
    Dashboard - Find My Product
    Sleep                           2

TC2 ::Adding goods to the shopping cart
    [Documentation]                 done
    [Tags]                          
    Connect to Emulator             
    Set user                        common_user
    Skip Login
    Dashboard - Find My Product
    Sleep                           2
    Dashboard - Find My Product
    Find Product in Search result   
    Add to Cart
    Modal Cart :: Check Product in Cart

TC3 :: Filtr
    [Documentation]                 Done                    
    Connect to Emulator
    Set user                        filter_user
    Skip Login
    Dashboard - Find My Product
    Sleep                           2
    Dashboard - Find My Product
    Click to Filter
    Filter Use filter and show Results
    Check if Filter has Cell Phones

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