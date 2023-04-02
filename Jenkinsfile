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
    stage('Prod') {
      steps{
        echo "Ready to deploy on production"
      }
    }
  }
  post{
    always{
       emailext to: "tarun.rawat@knoldus.com",
       subject: "Test Email",
       body: "Test",
       attachLog: true
    }
  }
}
