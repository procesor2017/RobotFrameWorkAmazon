const { expect } = require('chai')

class Menu{
    get MenuCount() {
        return $('id=cart_count');
    }

    async checkCountOfProductInCard(count){
        expect(await this.MenuCount.getText()).to.equal(count);
    }
}

module.exports = new Menu();