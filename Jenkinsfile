pipeline{
  agent any
  stages{
    stage('Docker Build') {
    	agent any
      steps {
        echo "building"
      	sh 'docker build -t project:latest -f Dockerfile'
        echo "Build complete"
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
