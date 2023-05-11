class LoginScreen{
    get skipLogin() {
        return $('id=skip_sign_in_button');
    }

    get doneAmazonWorldWide() {
        return $('.//android.view.View[@resource-id="landing-doneButton"]')
    }

    async waitForLoadLoginPage(){
        $('id=skip_sign_in_button').waitForDisplayed({
            timeout: 20000,
        });
    }

    /**
    * a method to encapsule automation code to interact with the page
    * e.g. to login using username and password
    */

    async loginSkip(){
        await this.doneAmazonWorldWide.click()
        await this.skipLogin.click();
    }

    async ResetMyApp(){
        await driver.closeApp();
        await driver.launchApp();
    }

}

module.exports = new LoginScreen();