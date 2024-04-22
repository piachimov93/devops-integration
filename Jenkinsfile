pipeline {
    agent any
    tools{
        maven 'maven_3.9.6'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/piachimov93/devops-integration']]])
                bat 'mvn clean install'
            }
        }
        stage('Build Docker Image'){
            steps{
                script {
                    bat 'docker build -t piachimov/devops-integration-demo .'
                }
            }
        }
        stage('Push docker image to hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u piachimov -p ${dockerhubpwd}'
                    }
                    sh 'docker push piachimov/devops-integration-demo'
                }
            }
        }
    }
}