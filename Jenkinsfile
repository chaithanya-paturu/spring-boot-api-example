node{
  stage('Git Checkout'){
    git 'https://github.com/chaithanya-paturu/spring_aws_git_jenkins.git'
    echo 'Git Checkout'
  }
  stage('Build Step'){
    sh 'docker build -t pravalli/app:1.0.0 .'
    echo 'Executing "docker build -t pravalli/app:1.0.0 ." command'
  }
  stage('Push Docker Image'){
   withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
      sh "docker login -u pravalli -p ${dockerHubPwd}"
   }
   sh 'docker push pravalli/app:1.0.0'
 }
  stage('Application '){
      def dockerRun = 'docker run -p 8081:8081 -d --name my-app pravalli/app:1.0.0'
      echo 'dockerRun - ${dockerRun}'
        sshagent(['dev-server']) {
          sh "ssh -o StrictHostKeyChecking=no ubuntu@ec2-54-89-81-162.compute-1.amazonaws.com ${dockerRun}"
        }
	  echo 'Deployed into the server
   }
}
