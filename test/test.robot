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

