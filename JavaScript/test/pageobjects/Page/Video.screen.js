const Common = require("../Components/Common")

class Video{
    async FindTVChannel() {
        await Common.swipeDownUntilFindElement($(`.//android.view.View[@content-desc="See more: Popular movies – Free with ads"]`));
    }

}

module.exports = new Video();