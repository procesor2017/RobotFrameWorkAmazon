class ModalFilterSearchbar{
    get getFilterSearchCellPhone() {
        return $(`.//android.view.View[@content-desc="Cell Phones"]`);
    }

    get getFilterSearchBrandSamsung() {
        return $(`.//android.view.View[@content-desc="SAMSUNG"]`);
    }

    get getFilterShowResults() {
        return $(`.//android.widget.TextView[contains(@text,"Show")]`);
    }

    get getShowFilter() {
        return $('id=Show');
    }

    async ClickToShowFilter(){
        await this.getFilterShowResults.click();
    }

    async ClickToCellPhones(){
        await this.getFilterSearchCellPhone.click();
    }

    async UseFilter(){
        await this.getShowFilter.click();
    }

}

module.exports = new ModalFilterSearchbar();