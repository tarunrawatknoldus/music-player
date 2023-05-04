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
      	withCredentials([string(credentialsId: 'dockerHub', variable: 'DOCKER_TOKEN')]) {
          sh "sudo docker login -u 'tarunsinghrawatknoldus' -p $DOCKER_TOKEN"
          sh "sudo docker push project:latest"
        }
      }
    }  
    stage("second step"){
      steps{
        echo "good to go for testing phase"
      }
    }
  }
}
