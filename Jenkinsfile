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
      }
    }
    post{
      success{
        body: 'Test Message', 
        subject: 'Test Subject', 
        to: 'tarun.rawat@knoldus.com'
      }
    }
   }
}
