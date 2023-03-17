# JSAmazon
Show how to automatizate mobile app with JS + Mocha + Appium


# Install
Install [npm](https://nodejs.org/en/)
Go to folder and use command:
```
npm install
```

# Run
Start appium in terminal/cmd
```
appium
```

Open new tab in terminal and use command: 
```
npm run wdio
```

# QoL
Detail for Appium ++ webdriver
https://webdriver.io/docs/api/appium/

How to work with elements:
https://webdriver.io/docs/selectors/
https://webdriver.io/docs/api/element


# Selectors:
xPath:
```
$(".//android.view.View[contains(@content-desc,'SAMSUNG')]")
```

Chain:
```
$(selector).className("android.view.View").textContains("${my_product}")
```

id:
```
$('id=rs_search_src_text')
```

More here:
https://www.lambdatest.com/blog/how-webdriverio-uses-selenium-locators/

# Assertions:
Chai:

https://webdriver.io/docs/assertion/

https://www.chaijs.com/api/assert/