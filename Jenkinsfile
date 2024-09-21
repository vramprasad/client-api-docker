pipeline {
    agent any
    tools{
        maven 'Maven3_9_8'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/vramprasad/client-api-docker']]])
                sh 'mvn clean package'
            }

        }
    } // End of stages 
} // End of pipeline