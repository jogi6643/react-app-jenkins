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
                sh 'docker build -t react-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker rm -f react-app || true'
                sh 'docker run -d -p 3000:80 --name react-app react-app'
            }
        }
    }
}
