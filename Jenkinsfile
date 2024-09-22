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
                withCredentials([usernamePassword(credentialsId: 'dockerhub_cred', passwordVariable: 'dockerpass', usernameVariable: 'dockerusername')]) {
                    sh 'docker login -u ${dockerusername} -p ${dockerpass}'
                    sh 'docker push vramprasad/client-api:v1.0'
                }
            }
        }
        stage('Deploying to Kubernetes') {
            steps {
                script {
                    kubernetesDeploy(configs: "deployment.yaml" , "service.yaml", kubeconfigId: 'minikube_cred')
                }
            }
        }
    } // End of stages 
} // End of pipeline