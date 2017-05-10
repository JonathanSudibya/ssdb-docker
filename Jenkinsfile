pipeline {
  agent any
  stages {
    stage('Building') {
      steps {
        sh 'docker build -t jonathans121/ssdb .'
      }
    }
    stage('Testing') {
      steps {
        sh '''id=$(docker run jonathans121/ssdb)
sleep 10
if ! docker top $id &>/dev/null
then
    echo "Container crashed unexpectedly..."
    return 1
fi
return 0'''
      }
    }
  }
}