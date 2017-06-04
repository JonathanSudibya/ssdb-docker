pipeline {
  agent any
  stages {
    stage('Building') {
      steps {
        sh 'docker build -t jonathans121/ssdb .'
      }
    }
    stage('Deploy') {
      steps {
        sh 'docker push jonathans121/ssdb'
      }
    }
  }
}