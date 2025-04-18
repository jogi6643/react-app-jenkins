pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                 git branch: 'main', url: 'https://github.com/jogi6643/react-app-jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("react-app")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove old container if running
                    sh 'docker rm -f react-app || true'

                    // Run new container
                    sh 'docker run -d -p 3000:80 --name react-app react-app'
                }
            }
        }
    }
}
