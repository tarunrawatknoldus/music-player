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
        sh "chmod a+x server.sh"
        sh "./server.sh"
        echo "Deployed Successfully"
        emailext body: 'Test Message', subject: 'Test Subject', to: 'test@example.com'
      }
    }
    post{
      sucess{
        emailext body: 'Test Message', 
        subject: 'Test Subject', 
        to: 'test@example.com'
      }
    }
   }
}
