pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'rohith1750/spring-petclinic'     // Replace with your DockerHub repo
        REGISTRY_CREDENTIALS = 'docker-hub-creds'        // Replace with your Jenkins credential ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
                echo '✅ Repository cloned successfully.'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image...'
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo '📦 Pushing Docker image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: "${REGISTRY_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $DOCKER_IMAGE
                    """
                }
            }
        }
    }

    post {
        success {
            echo '🎉 Docker image built and pushed successfully!'
        }
        failure {
            echo '❌ Build failed. Please check the logs.'
        }
    }
}
