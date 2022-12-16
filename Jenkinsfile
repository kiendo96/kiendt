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
                    docker.build("harbor.kindt.io/library/hello-world:${TAG}")
                }
            }
        }
        stage('Pushing Docker Image to Dockerhub') {
            steps {
                script {
                    docker.withRegistry('http://harbor.kindt.io/', 'docker_credential') {
                        docker.image("harbor.kindt.io/library/hello-world:${TAG}").push()
                        docker.image("harbor.kindt.io/library/hello-world:${TAG}").push("latest")
                    }
                }
            }
        }
        stage('Deploy to cluster'){
            steps {
                sh 'mkdir /etc/deploy'
                sh 'cp config /etc/deploy'
                sh 'kubectl config get-contexts'
            }
        }
    }
}