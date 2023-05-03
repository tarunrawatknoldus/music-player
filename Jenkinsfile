pipeline{
  agent any
  stages{
    stage('Docker Build') {
    	agent any
      steps {
        echo "building"
      	sh 'sudo docker build -t project:latest .'
        echo "Build complete"
      }
    }
    stage("second step"){
      steps{
        echo "good to go for testing phase"
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
