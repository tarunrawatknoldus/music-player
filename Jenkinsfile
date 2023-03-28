pipeline{
  agent any
  stages
  {
    stage('build') {
      steps{
        sh "ALLOWED_HOSTS = ['16.16.79.227']"
        sh "python3 manage.py runserver 16.16.79.227:8282"
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
