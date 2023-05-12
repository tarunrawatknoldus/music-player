pipeline{
    agent any
    environment{
        IMAGE_TAG = "BUILD_NUMBER"
    }
    stages
    {
        
        //this is the deployment pipeline
        stage('Docker Build') {
            when{
            anyOf{
                branch 'development'
                //branch 'production'
                //branch 'testing'
            }
            }
            steps {
                echo "building"
                sh 'sudo docker build -t project:V.$BUILD_NUMBER .'
                echo "Build complete"
            }
        }
        stage('DockerHub creds and login') {
            when{
            anyOf{
                branch 'development'
                //branch 'production'
                //branch 'testing'
            }
            }
            steps {
                withCredentials([string(credentialsId: 'dockerHub', variable: 'DOCKER_TOKEN')]) {
                sh "sudo docker login -u 'tarunsinghrawatknoldus' -p $DOCKER_TOKEN"
                echo "login successful"
                }
            }
        }  
        stage('Docker Push') {
            when{
            anyOf{
                branch 'development'
                //branch 'production'
                //branch 'testing'
            }
            }
            steps {
            sh "sudo docker tag project:V.$BUILD_NUMBER tarunsinghrawatknoldus/project:V.$BUILD_NUMBER"
            sh "sudo docker push tarunsinghrawatknoldus/project:V.$BUILD_NUMBER"
            echo "image is pushed"
        }
        }  
        stage("BUILD COMPLETE"){
            when{
            anyOf{
                branch 'development'
                //branch 'production'
                //branch 'testing'
            }
            }
            steps{
                echo "good to go for testing phase"
            }
        }

        //this is the testing pipeline
        stage('Test1') {
            when{
            anyOf{
                //branch 'development'
                //branch 'production'
                branch 'testing'
            }
            }
            steps{
                echo "first test"
            }
        }
        stage('Test2') {
            when{
            anyOf{
                //branch 'development'
                //branch 'production'
                branch 'testing'
            }
            }
            steps{
                echo "second test"
                echo "testing complete"
            }
        }
        stage('Prod') {
            when{
            anyOf{
                //branch 'development'
                //branch 'production'
                branch 'testing'
            }
            }
            steps{
                echo "Good to go for production"
            }
        }
        //artifact building
        stage('Generate Artifact'){
            when{
            anyOf{
                branch 'development'
                //branch 'production'
                //branch 'testing'
            }
            }
            steps{
                script{
                sh '''
                tar -cf app.tar ./
                    '''
            }
        }
    }

        //this is the production pipeline
        stage('Production for Kubernetes') {
            when{
            anyOf{
                //branch 'development'
                branch 'main'
                //branch 'testing'
            }
            }
            steps{
                echo "pulling latest image"
                withCredentials([file(credentialsId: 'oi', variable: 'var1')]) {
                //sh "minikube start"
                sh "sudo chmod 777 /home/knoldus/.minikube/profiles/minikube/client.key"
                sh "python3 manage.py createsuperuser --username admin --noinput --email admin@exmaple.com"
                sh "kubectl create deployment finalproject-$BUILD_NUMBER --image=tarunsinghrawatknoldus/project:V.$BUILD_NUMBER --kubeconfig=$var1 "
                sh "sleep 20"
                //sh "kubectl run deployment finalproject-$BUILD_NUMBER --type=NodePort --hostNetwork=True --kubeconfig=$var1"
                sh "kubectl expose deployment finalproject-$BUILD_NUMBER --type=NodePort --port=8000 --target-port=8000 --kubeconfig=$var1 "
                //sh "sleep 10"
                sh "kubectl port-forward service/finalproject-$BUILD_NUMBER 8000:8000 --kubeconfig=$var1 "
                //sh "sudo ssh -R 80:192.168.49.2:8000 serveo.net"
                }
            }
        }

        stage('project is running') {
            when{
            anyOf{
                //branch 'development'
                branch 'main'
                //branch 'testing'
            }
            }
            steps{
                echo "The project is up and running"
            }
        }
    }
}
