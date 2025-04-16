pipeline {
    agent any

    environment {
        IMAGE_NAME = "react-app"
        CONTAINER_NAME = "my-react-app"
        PORT = "3000"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/jogi6643/react-app-jenkins.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    docker.image('node:18').inside {
                        sh 'npm install'
                    }
                }
            }
        }

        stage('Build React App') {
            steps {
                script {
                    docker.image('node:18').inside {
                        sh 'npm run build'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build --no-cache -t $IMAGE_NAME .'
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p $PORT:80 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }

    }

    post {
        always {
            echo '✅ Build and deployment complete!'
        }
    }
}
