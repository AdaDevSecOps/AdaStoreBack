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
   
    stage('build'){
        steps {
            withCredentials([...]) {

                    sh '''
                        alias python=python3.8.7
                        python -m venv --system-site-packages venv # only for jenkins
                        python -u setup.py
                        . venv/bin/activate

                        which chromedriver #/usr/bin/chromedriver  
                        chromedriver-path #path/to/python/lib/python3.8.7/site-packages/chromedriver_binary
                        export PATH=$(chromedriver-path):$PATH
                        
                        echo $PATH # just to check the output, your path should be on the beginning
                        which chromedriver # this should now find the proper chromedriver
                        
                    '''

                    sh "python -m pytest"
                }

            }
        }
    }
  }
}



