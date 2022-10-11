pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/AdaDevSecOps/AdaStoreBack.git', branch: 'main')
      }
    }

    stage('Release') {
      steps {
        echo 'Ready to release etc-ex.'
      }
    }
    stage('Build Container Image') {
      steps {
        agent{
          dockerfile {
              filename '$workspace/dockerfile'       
          }
        }
      }
    }
    stage('Build') {
       steps {
         sh 'npm install'
       }
    }
    stage('Test') {
      steps {
        sh "pwd"
      }
    }
  
  }
}



