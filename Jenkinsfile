pipeline {
    agent any
    tools {
        maven '3.6.3' 
    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    docker.build("harbor.kindt.io/library/my-app:${TAG}")
                }
                sh 'whoami'
            }
        }
        stage('Pushing Docker Image to Dockerhub') {
            steps {
                script {
                    docker.withRegistry('http://harbor.kindt.io/', 'docker_credential') {
                        docker.image("harbor.kindt.io/library/my-app:${TAG}").push()
                        docker.image("harbor.kindt.io/library/my-app:${TAG}").push("latest")
                    }
                }
            }
        }
        stage('Deploy to cluster'){
            steps {
                sh 'sudo cp config /root/.kube/'
                sh 'update new code to server'
                sh 'tao cung khong hieu lam'
            }
        }
    }
}
