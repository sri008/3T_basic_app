pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-west-1'
        AWS_ACCESS_KEY_ID = 'YOUR_ACCESS_KEY'
        AWS_SECRET_ACCESS_KEY = 'YOUR_SECRET_KEY'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("my-docker-image-name")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://your.docker.registry', 'your-docker-credentials-id') {
                        docker.image("my-docker-image-name").push("latest")
                    }
                }
            }
        }

        stage('Deploy to AWS') {
            steps {
                script {
                    sh "terraform init"
                    sh "terraform apply -auto-approve"
                }
            }
        }
    }
}

