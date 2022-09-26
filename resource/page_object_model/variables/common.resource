*** Variables ***
#------------------------- Connect to Emulator-------------------------------------#
${APPIUM_SERVER}                http://localhost:4723/wd/hub
${PACKAGE_NAME}                 com.amazon.mShop.android.shopping
${APP_MAIN_ACTIVITY}            com.amazon.mShop.home.HomeActivity  # com.amazon.mShop.navigation.MainActivity
${RESET_OFF}                    false
${FULL_RESET_ON}                true