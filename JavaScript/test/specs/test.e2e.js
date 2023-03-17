const { remote } = require('webdriverio');
const LoginScreen = require("../pageobjects/Page/Login.screen");
const DashboardScreen = require("../pageobjects/Page/Dashboard.screen")
const SearchResultScreen = require("../pageobjects/Page/SearchResult.screen")
const ProductScreen = require("../pageobjects/Page/Product.screen")
const Video = require("../pageobjects/Page/Video.screen");


describe("Ours Test", () => {
    beforeEach(async () => {
        await LoginScreen.waitForLoadLoginPage();       
    });

    afterEach(async () =>{
        await LoginScreen.ResetMyApp();
    });

    it("TC1 :: Find Product", async () => {
        await LoginScreen.loginSkip();
        await DashboardScreen.CheckDashboardWasLoaded();
        await DashboardScreen.FindProduct("Samsung");
    });

    it("TC2 :: Add product to Card", async () => {
        await LoginScreen.loginSkip();
        await DashboardScreen.CheckDashboardWasLoaded();
        await DashboardScreen.FindProduct("Samsung");
        await DashboardScreen.CheckDashboardWasLoaded();
        await DashboardScreen.FindProduct("Samsung");
        await SearchResultScreen.FindProductInSeachResult("SAMSUNG");
        await ProductScreen.addProductToCart();
    }); 

    it("TC3 :: Filter", async () =>{
        await LoginScreen.loginSkip();
        await DashboardScreen.CheckDashboardWasLoaded();
        await DashboardScreen.FindProduct("Samsung");
        await DashboardScreen.CheckDashboardWasLoaded();
        await DashboardScreen.FindProduct("Samsung");
        await SearchResultScreen.ClickToFilter();
        await SearchResultScreen.FilterMyProduct();
    })

    it("TC4 :: Category", async () => {
        await LoginScreen.loginSkip();
        await DashboardScreen.CheckDashboardWasLoaded();
        await DashboardScreen.ClickToVideo();
        await Video.FindTVChannel();
    })

});

