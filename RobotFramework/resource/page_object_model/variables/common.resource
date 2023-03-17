*** Variables ***
#------------------------- Connect to Emulator-------------------------------------#
${APPIUM_SERVER}                http://localhost:4723/wd/hub
${PACKAGE_NAME}                 com.amazon.mShop.android.shopping
${APP_MAIN_ACTIVITY}            com.amazon.mShop.home.HomeActivity  # com.amazon.mShop.splashscreen.StartupActivity
${RESET_OFF}                    false
${RESET_ON}                     true
${FULL_RESET_ON}                true
${FULL_RESET_OFF}               false
${NEW_COMMAND_TIMEOUT}          0
${LANDSCAPE}                    LANDSCAPE
${platformVersion}              11
${deviceName}                   pixel_2
${automationName}               UiAutomator2
${unicodeKeyboard}              true
${resetKeyboard}                true
${udid}                         emulator-5554
${APP_MAIN_2nd_ACTIVITY}        com.amazon.mShop.navigation.MainActivity
${skipDeviceInitialization}     true
${skipServerInstallation}       true

