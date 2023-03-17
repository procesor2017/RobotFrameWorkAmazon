const Searchbar = require("../Components/Searchbar.components")
const Common = require("../Components/Common")

class Dashboard {
    async CheckDashboardWasLoaded() {
        await Searchbar.OpenSearchbar.waitForDisplayed({
            timeout: 20000,
        })
    }

    async FindProduct(myProduct) {
        await Searchbar.FindProduct(myProduct);
    }

    async ClickToVideo(){
        await Common.waitAndClick("Video");
    }

}

module.exports = new Dashboard();