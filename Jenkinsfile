pipeline {
    agent any

    environment {
        IMAGE_NAME = 'react-app'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/jogi6643/react-app-jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 3000:80 --name react-app $IMAGE_NAME'
            }
        }
    }
}
