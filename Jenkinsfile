pipeline{
    agent any
    environment{
        IMAGE_TAG = "BUILD_NUMBER"
    }
    stages
    {
        //this is the deployment pipeline
        stage('Docker Build') {
            steps {
                echo "building"
                sh 'sudo docker build -t project:V.$BUILD_NUMBER .'
                echo "Build complete"
            }
        }
        stage('DockerHub creds and login') {
            steps {
                withCredentials([string(credentialsId: 'dockerHub', variable: 'DOCKER_TOKEN')]) {
                sh "sudo docker login -u 'tarunsinghrawatknoldus' -p $DOCKER_TOKEN"
                echo "login successful"
                }
            }
        }  
        stage('Docker Push') {
            steps {
            sh "sudo docker tag project:V.$BUILD_NUMBER tarunsinghrawatknoldus/project:V.$BUILD_NUMBER"
            sh "sudo docker push tarunsinghrawatknoldus/project:V.$BUILD_NUMBER"
            echo "image is pushed"
        }
        }  
        stage("BUILD COMPLETE"){
            steps{
                echo "good to go for testing phase"
            }
        }

        //this is the testing pipeline
        stage('Test1') {
            steps{
                echo "first test"
            }
        }
        stage('Test2') {
            steps{
                echo "tsecond test"
                echo "testing complete"
            }
        }
        stage('Prod') {
            steps{
                echo "Good to go for production"
            }
        }

        //this is the production pipeline
        stage('Production for Kubernetes') {
            steps{
                echo "pulling latest image"
                withCredentials([file(credentialsId: 'oi', variable: 'var1')]) {
                //sh "minikube start"
                sh "sudo chmod 777 /home/knoldus/.minikube/profiles/minikube/client.key"
                sh "kubectl create deployment finalproject-$BUILD_NUMBER --image=tarunsinghrawatknoldus/project:V.$BUILD_NUMBER --kubeconfig=$var1 "
                sh "kubectl expose deployment finalproject-$BUILD_NUMBER --type=NodePort --port=8000 --target-port=8000 --kubeconfig=$var1 "
                sh "sleep 15"
                    
                //sh "sleep 10"
                sh "kubectl port-forward service/finalproject-$BUILD_NUMBER 8000:8000 --kubeconfig=$var1 "
                }
            }
        }

        stage('project is running') {
            steps{
                echo "The project is up and running"
            }
        }
    }
}
