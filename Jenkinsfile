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

