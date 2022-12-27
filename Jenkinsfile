def dockerimage
 environment {
    registry = "amalguesmi/phpappauth"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
pipeline {

  agent any

      stages {
         stage('verify version') {
      
             steps {
              sh 'python --version'
               }
         }
         stage('Build image with docker') {
             steps{
                script{
                   
                   dockerImage = docker.build("amalguesmi/todo_list:latest")
                  
                }
             }
                    
          }   
         stage('login') {
          steps {
      
           sh 'python manage.py'
        
           }
         }
         stage('Push image') {
            steps{
                script{
                      withCredentials([usernamePassword( credentialsId: 'docker-hub', usernameVariable: 'amalguesmi', passwordVariable: '22651530mama')]) {
        
                      sh ' docker login -u amalguesmi -p 22651530mama  '
                      // Push your image now
                      sh "docker push amalguesmi/todo_list:latest"
                
                     
                }
             }
         } 
      }
    } 
} 
    
