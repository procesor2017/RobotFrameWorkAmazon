***Settings***
Documentation       Common TC
Resource            ${EXECDIR}/__init.robot
Suite Setup         Init


***Test Cases***
TC2 ::Adding goods to the shopping cart
    [Documentation]                 done
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
    [Tags]                     2
    Connect to Emulator
    Set user                        filter_user
    Skip Login
    Click To Video
    Find TV Channel