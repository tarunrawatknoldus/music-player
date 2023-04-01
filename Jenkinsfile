pipeline{
  agent any
  stages{
    stage('Build') {
      steps{
        echo "Building"
        echo "Build COmplete"
      }
    }
    stage('Test') {
      steps{
        echo "testing"
        echo "testing complete"
      }
    }
    stage('Deploy') {
      steps{
        sh "python3 manage.py runserver 0:8002"
        sh "python3 manage.py runserver"
        echo "Deployed Successfully"
        emailext body: 'Test Message', subject: 'Test Subject', to: 'test@example.com'
      }
    }
   }
}
