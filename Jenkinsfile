node{
  stage('Git Checkout'){
    git 'https://github.com/chaithanya-paturu/spring_aws_git_jenkins.git'
    echo 'Git Checkout'
  }
  stage('Build Step'){
    sh 'docker build -t pravalli/app .'
    echo 'Executing "docker build -t pravalli/app ." command'
  }
  stage('Application '){
      def dockerRun = 'docker run -p 8081:8081 -d --name my-app pravalli/app'
      echo 'dockerRun - ${dockerRun}'
        sshagent(['dev-server']) {
          sh "ssh -o StrictHostKeyChecking=no ubuntu@ec2-54-89-81-162.compute-1.amazonaws.com ${dockerRun}"
        }
	  echo 'Deployed into the server
   }
}
