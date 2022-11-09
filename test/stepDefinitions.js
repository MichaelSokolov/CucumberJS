const { Before, After, Given, When, Then, setDefaultTimeout } = require("@cucumber/cucumber");
const { Builder, By, Key } = require("selenium-webdriver");
const should = require('chai').should();
const fs = require('fs')
let driver;
setDefaultTimeout(60000);

Before(async function () {
    driver = await new Builder().forBrowser('chrome').build();
    await driver.manage().setTimeouts({ implicit: 5000 });
})

After(async function (scenario) {
    if (scenario.result.status == 'FAILED') {
        const image = await driver.takeScreenshot();
        fs.writeFileSync(`./screenshot_${scenario.pickle.name}.png`, image, 'base64');
        this.attach(image, 'image/png');
    }
    await driver.quit();
})

Given('I navigate to {string} website', async function (url) {
    await driver.get(url)
});

When('I enter {string} to the {string} field', async function (value, field) {
    await driver.findElement(By.name(field)).sendKeys(value, Key.TAB);
})

Then('the error message {string} should be shown for {string} field', async function (errorMSG, field) {
    const errorMessage = await driver.findElement(By.id(`${field}-error`));

    const errorMessageVisibility = await errorMessage.isDisplayed();
    const errorMessageText = await errorMessage.getText();

    errorMessageVisibility.should.be.true;
    errorMessageText.should.equal(errorMSG, `The ${field} error message is not as expected`)
})
