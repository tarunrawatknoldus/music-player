pipeline{
  agent any
  stages{
    stage('Build') {
      steps{
        echo "Building"
        echo "Build COmplete"
      }
    }
  }
  post{
    always{
       mail to: "tarun.rawat@knoldus.com",
       subject: "Test Email",
       body: "Test",
       compressLog: true
    }
  }
}
