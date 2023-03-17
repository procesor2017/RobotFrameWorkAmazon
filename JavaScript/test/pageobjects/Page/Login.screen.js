class LoginScreen{
    get skipLogin() {
        return $('id=skip_sign_in_button');
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
        await this.skipLogin.click();
    }

    async ResetMyApp(){
        await driver.closeApp();
        await driver.launchApp();
    }

}

module.exports = new LoginScreen();