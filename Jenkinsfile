pipeline {
   agent {
       docker {
           image 'docker-agent:latest'
       }
   }

   stages {
      stage('Git pull') {
         steps {
            git(url: 'https://github.com/boxfuse/boxfuse-sample-java-war-hello.git', branch: 'master', poll: true)
         }
      }
      stage('Build package') {
          steps {
              sh 'mvn package'
          }
      }
      stage('Build container') {
          steps {
              sh 'mv target/hello-1.0.war /opt/build/'
              sh 'cd /opt/build/ && docker build --tag 172.17.0.3:5000/boxfuse-jenkins .'
              sh 'docker push 172.17.0.3:5000/boxfuse-jenkins'
          }
      }
      stage('Run container') {
          steps {
              sh 'docker run -it -d -p 8081:8080 --name boxfuse-jenkins 172.17.0.3:5000/boxfuse-jenkins'
          }
      }
   }
}
