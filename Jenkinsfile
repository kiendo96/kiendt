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
                    sh 'docker build -t "harbor.kiendt.io/library/hello-world:${TAG}" .'
                }
            }
        }
    }
}
