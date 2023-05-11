const Common = require("../Components/Common")

class Video{
    async FindTVChannel() {
        await Common.swipeDownUntilFindElement($(`.//android.view.View[contains(@text,"New release movie rentals")]`));
    }

}

module.exports = new Video();