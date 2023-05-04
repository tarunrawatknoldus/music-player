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
    stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([string(credentialsId: 'dockerhub', variable: 'DOCKER_TOKEN')]) 
        {
          sh "docker login -u 'tarunsinghrawatknoldus'  -p $DOCKER_TOKEN"
          sh 'docker push project:latest'
        }
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
