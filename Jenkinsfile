pipeline{
  agent any
  stages
  {
    stage('build') {
      steps{
        sh "sudo exec ./manage.py runserver 16.16.79.227:8282"
        sh "sudo chmod +x runserver"
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
