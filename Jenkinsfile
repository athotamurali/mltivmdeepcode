pipeline {
    agent any

    environment {
        // Use Jenkins credentials for Azure authentication
        AZURE_SUBSCRIPTION_ID = credentials('azure-subscription-id')
        AZURE_CLIENT_ID       = credentials('azure-client-id')
        AZURE_CLIENT_SECRET   = credentials('azure-client-secret')
        AZURE_TENANT_ID       = credentials('azure-tenant-id')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/athotamurali/mltivmdeepcode.git'
            }
        }

        stage('Debug') {
            steps {
                sh 'echo "Subscription ID: $AZURE_SUBSCRIPTION_ID"'
                sh 'echo "Client ID: $AZURE_CLIENT_ID"'
                sh 'echo "Client Secret: $AZURE_CLIENT_SECRET"'
                sh 'echo "Tenant ID: $AZURE_TENANT_ID"'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform/environments/dev') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform/environments/dev') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform/environments/dev') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        success {
            echo 'Terraform deployment succeeded!'
        }
        failure {
            echo 'Terraform deployment failed!'
        }
