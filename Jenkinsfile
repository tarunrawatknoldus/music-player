pipeline{
  agent any
  stages
  {
    stage('build') {
      steps{
        sh "sudo apt install python3 python3-pip -y"
        sh "sudo python3 install django -y"
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
