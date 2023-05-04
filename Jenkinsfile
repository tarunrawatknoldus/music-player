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
          sh "docker login -u 'tarunsinghrawatknoldus' -p $DOCKER_TOKEN"
          sh 'docker tag project:latest tarunsinghrawatknoldus/project:latest'
          sh 'docker push tarunsinghrawatknoldus/project:latest'
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
