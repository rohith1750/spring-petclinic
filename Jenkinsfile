pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
                echo '✅ Repository cloned successfully.'
            }
        }
    }

    post {
        success {
            echo '🎉 Stage 1 completed successfully!'
        }
        failure {
            echo '❌ Failed to clone the repository.'
        }
    }
}
