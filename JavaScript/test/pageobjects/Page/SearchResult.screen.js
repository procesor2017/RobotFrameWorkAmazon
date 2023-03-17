const ModalFilterSearchbar = require("../Components/ModalFilterSearchbar.components")

class SearchResult{
    get getFilter() {
        return $(`.//android.widget.ToggleButton[@resource-id='s-all-filters']`);
    }

    async FindProductInSeachResult(my_product){
        await browser.pause(1000);
        const selector = $(`.//android.view.View[contains(@content-desc,"${my_product}")]`);
        await selector.click();
    }

    async ClickToFilter(){
        await this.getFilter.click();
    }

    async FilterMyProduct(){
        ModalFilterSearchbar.ClickToCellPhones();
        ModalFilterSearchbar.ClickToShowFilter();
    }

}

module.exports = new SearchResult();