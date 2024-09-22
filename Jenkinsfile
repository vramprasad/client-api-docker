pipeline {
    agent any
    environment {
        dockerimagename = "vramprasad/client-api-docker"
        dockerImage = ""
    }
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
            steps{
                script {
                    dockerImage = docker.build dockerimagename
                }
            }
        }
        stage('Push Docker Image') {
            environment {
                registryCredential = 'dockerhub_cred'
            }    
            steps {
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                    dockerImage.push("latest")
                    }
                }
            }
        }
        /*stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_cred', passwordVariable: 'dockerpass', usernameVariable: 'dockerusername')]) {
                    sh 'docker login -u ${dockerusername} -p ${dockerpass}'
                    sh 'docker push vramprasad/client-api:v1.0'
                }
            }
        } */
    } // End of stages 
} // End of pipeline