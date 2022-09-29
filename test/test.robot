***Settings***
Documentation       Common TC
Resource            ${EXECDIR}/__init.robot
Suite Setup         Init


***Test Cases***
Poc :: TC
    Connect to Emulator
    Set user                        common_user
    Skip Login
    Dashboard - Find My Product
    Sleep                           2
    Dashboard - Find My Product
    Find Product in Search result   
    Add to Cart
