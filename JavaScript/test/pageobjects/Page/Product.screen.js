const Common = require("../Components/Common")
const MenuComponents = require("../Components/Menu.components")

class Product{
    async findCard() {
        await Common.swipeDownUntilFindElement($(`.//android.widget.Button[@text="Add to Cart"]`));    
    }

    get addToCart () {
        return $(`.//android.widget.Button[@text="Add to Cart"]`);
    }

    async addProductToCart () {
        await this.findCard();
        await this.addToCart.click();
        await driver.pause(2500);
        await MenuComponents.checkCountOfProductInCard('1');
    }
}

module.exports = new Product();