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
      stage ('SonarQube scan'){
         steps {
            withSonarQubeEnv(installationName: 'sonarqube-server'){
               sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
            }
         }
      }
      stage ('upload war to nexus server'){
         steps{
            nexusPublisher nexusInstanceId: 'nexus-server', nexusRepositoryId: 'maven-releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: 'war', filePath: '/var/jenkins_home/workspace/test/web/target/time-tracker-web-0.3.1.war']], mavenCoordinate: [artifactId: 'time-tracker', groupId: 'time-tracker', packaging: 'war', version: '0.3.1']]]      
         }
      }
   }
}