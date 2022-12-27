def dockerimage
 environment {
    registry = "amalguesmi/todo_list"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
pipeline {
  agent any
  stages {
    

   node {
    // Mark the code checkout 'stage'....
    stage 'Checkout'

    // Get the code from a GitHub repository
    git credentialsId: 'mycredentials', url: 'https://github.com/<user>/<project>/'

    // Mark the code build 'stage'....
    stage 'Build'

    env.WORKSPACE = pwd()

    sh 'virtualenv --python=python34 venv'
    sh 'source venv/bin/activate'

    sh 'pip install -r requirements.txt'

    env.DJANGO_SETTINGS_MODULE = "<appname>.settings.jenkins"

    // Start the tests
    stage 'Test'
    sh 'python34 manage.py test --keepdb'

 
    
   stage('Push image') {
            steps{
                script{
           
         //           withDockerRegistry([credentialsId: "docker-hub", url:""]){
           //         dockerImage.push()
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
}