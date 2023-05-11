const Searchbar = require("../Components/Searchbar.components")
const Common = require("../Components/Common")

class Dashboard {
    get menuVideo() {
        return $(`//android.widget.TextView[@resource-id='com.amazon.mShop.android.shopping:id/subnav_button_text' and contains(@text,"Video")]`)
    }


    async CheckDashboardWasLoaded() {
        await Searchbar.OpenSearchbar.waitForDisplayed({
            timeout: 20000,
        })
    }

    async FindProduct(myProduct) {
        await Searchbar.FindProduct(myProduct);
    }

    async ClickToVideo(){
        await this.menuVideo.click();
    }

}

module.exports = new Dashboard();