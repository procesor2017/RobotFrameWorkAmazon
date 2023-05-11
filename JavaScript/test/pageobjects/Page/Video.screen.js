const Common = require("../Components/Common")

class Video{
    async FindTVChannel() {
        await Common.swipeDownUntilFindElement($(`.//android.view.View[contains(@text,"Prime Top-rated movies See more")]`));
    }

}

module.exports = new Video();