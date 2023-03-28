pipeline{
  agent any
  stages
  {
    stage('build') {
      steps{
        sh "exec ./manage.py runserver 16.16.79.227:8282"
        sh "chmod +x runserver"
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
