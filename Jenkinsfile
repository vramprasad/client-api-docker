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
        stage('Build Docker Image') {
            steps {
                sh 'docker build . -t vramprasad/client-api:v1.0'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub_pwcred', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u vramprasad -p ${dockerhubpwd}'
                    sh 'docker push vramprasad/client-api:v1.0'
                }
            }
        }
    } // End of stages 
} // End of pipeline