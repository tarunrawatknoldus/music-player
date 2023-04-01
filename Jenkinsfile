pipeline{
  agent any
  stages
  {
    stage('build') {
      steps{
        sh "python3 manage.py runserver 0:8002"
        sh "python3 manage.py runserver"
      }
    }
    stage('Test') {
      steps{
        echo "testing"
      }
    }
    stage('Deploy') {
      steps{
        echo "deploy complete"
      }
    }
   }
}
