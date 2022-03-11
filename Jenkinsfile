node{
  stage('Git Checkout'){
    git 'https://github.com/chaithanya-paturu/spring_aws_git_jenkins.git'
    echo 'Git Checkout'
  }
  stage('Compile-Package'){
    sh 'mvn package'
    echo 'mvn packages'
  }
}
