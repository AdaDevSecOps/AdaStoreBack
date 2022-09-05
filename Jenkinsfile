pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/sarunnaphatra/SKC-Automation.git', branch: 'main')
      }
    }

    stage('Release') {
      steps {
        echo 'Ready to release etc-ex.'
      }
    }
    stage('Init') {
      apt-get install python3-pip -y
          pip install webdriver-manager
          pip install chromedriver-py==105.0.5195.52
          pip install robotframework
          pip install --user robotframework-selenium2library
          robot skc.robot
          touch test$(date +%Y%m%d)
          cat skc.robot

    }
  }
}

from selenium import webdriver

options = webdriver.ChromeOptions()
options.add_argument('--headless')
# options.add_argument('window-size=1200x600')
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')

browser = webdriver.Chrome(chrome_options=options)
#If the chromedriver is not set in the PATH environment variable, specify the chromedriver location with the executable_path option.
#browser = webdriver.Chrome(chrome_options=options, executable_path="/usr/local/bin/chromedriver")

url = "http://google.com"

browser.get(url)
browser.save_screenshot("Website.png")
browser.quit()

