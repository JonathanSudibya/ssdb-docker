pipeline {
  agent {
    docker {
      image 'ubuntu:16.04'
    }
    
  }
  stages {
    stage('Building') {
      steps {
        sh 'docker build -t jonathans121/ssdb .'
      }
    }
  }
}