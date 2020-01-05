pipeline {
   agent any

   tools {
      maven 'maven 3.6.3'
   }
    
   stages {
      stage('Get resources') {
         steps {
            git 'https://github.com/asafMeytal/course.git'
         }
      }
      stage ('Build'){
         steps
            {
               sh 'mvn package'
            }
      }
   }
}