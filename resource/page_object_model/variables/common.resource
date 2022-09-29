*** Variables ***
#------------------------- Connect to Emulator-------------------------------------#
${APPIUM_SERVER}                http://localhost:4723/wd/hub
${PACKAGE_NAME}                 com.amazon.mShop.android.shopping
${APP_MAIN_ACTIVITY}            com.amazon.mShop.home.HomeActivity  # com.amazon.mShop.android.shopping/com.amazon.mShop.home.HomeActivity
${RESET_OFF}                    false
${RESET_ON}                     true
${FULL_RESET_ON}                true
${FULL_RESET_OFF}               false
${NEW_COMMAND_TIMEOUT}          0
