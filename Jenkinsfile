pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-app"
        CONTAINER_NAME = "flask-container"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/isrinidhi09/jt7.git'
            }
        }

        stage('Docker Login') {
    steps {
        script {
            withCredentials([usernamePassword(credentialsId: 'dhubcd', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                bat "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USER} --password-stdin"
            }
        }
    }
}



        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    bat "docker run -d -p 5001:5000 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    bat "docker rm -f ${CONTAINER_NAME} || echo 'Container not found'"
                    bat "docker rmi -f ${IMAGE_NAME} || echo 'Image not found'"
                }
            }
        }
    }
}
