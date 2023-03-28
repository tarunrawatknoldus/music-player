pipeline{
  agent any
  stages
  {
    stage('build') {
      steps{
        sh "apt install python3 python3-pip"
        sh "python3 install django"
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
