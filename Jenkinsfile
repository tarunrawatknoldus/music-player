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
    success{
            mail to: "tarun.rawat@knoldus.com",
            subject: "Testing Build is successfull",
            body: "success"}
    failure{
      mail to: "tarun.rawat@knoldus.com",
            subject: "Testing Build is failed",
            body: "failed"
     }
   }
}
