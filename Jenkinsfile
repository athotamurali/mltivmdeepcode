pipeline {
    agent any

    environment {
        // Use Jenkins credentials to set GitHub credentials
        GITHUB_CREDENTIALS = credentials('github-credentials') // Jenkins credential ID for GitHub credentials
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository using GitHub credentials
                script {
                    def repoUrl = "https://${GITHUB_CREDENTIALS_USR}:${GITHUB_CREDENTIALS_PSW}@github.com/your-username/your-repo.git"
                    git branch: 'main', url: repoUrl
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                // Add build steps here
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add test steps here
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the project...'
                // Add deployment steps here
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
