pipeline {
  agent any
  stages {
    stage('Building') {
      steps {
        sh 'docker build -t jonathans121/ssdb .'
      }
    }
  }
}