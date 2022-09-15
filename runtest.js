const { Builder, By } = require('selenium-webdriver');
const { Options } = require('selenium-webdriver/chrome');

(async function hello() {
    let driver;

    try {
       
        let builder = new Builder().forBrowser('chrome');
        let options = new Options();
        options.headless();                             
        options.excludeSwitches(['enable-logging']);    
        options.addArguments(['--no-sandbox']);         
        driver = await builder.setChromeOptions(options).build();

        
        await driver.get('https://www.google.com');
        const btnText = await driver.findElement(By.name('btnK')).getAttribute('value');
        console.log(`Google button text: ${btnText}`);
    } catch (e) {
        console.log(e);
    } finally {
        if (driver) {
            await driver.close(); 
            await driver.quit();
        }
    }
})();