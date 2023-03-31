pipeline{
  agent any
  stages
  {
    stage('build') {
      steps{
        sh "sudo apt install python3 -y"
        sh "sudo apt update -y"
        sh "pip3 install django"
        sh "python3 manage.py runserver 0:8000"
        sh "python3 manage.py runserver"
      }
    }
    stage('Deploy') {
      steps{
        echo "deploy complete"
      }
    }
   }
}
