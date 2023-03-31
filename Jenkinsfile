pipeline{
  agent any
  stages
  {
    stage('build') {
      steps{
        sh "python3 manage.py runserver 0:8002/testing"
        sh "python3 manage.py runserver"
      }
    }
    stage('Deploy') {
      steps{
        echo "deploy complete"
      }
    }
   }
}
