pipeline {
    agent any

    environment {
        // Retrieve credentials securely from Jenkins
        AZURE_SUBSCRIPTION_ID = credentials('azure-subscription-id')
        AZURE_CLIENT_ID       = credentials('azure-client-id')
        AZURE_CLIENT_SECRET   = credentials('azure-client-secret')
        AZURE_TENANT_ID       = credentials('azure-tenant-id')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    echo "Checking out the repository..."
                }
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/athotamurali/mltivmdeepcode.git',
                        credentialsId: 'github-credentials' // Use stored GitHub credentials
                    ]]
                ])
            }
        }

        stage('Debug Credentials') {
            steps {
                script {
                    echo "### Debugging Credentials ###"
                    echo "AZURE_SUBSCRIPTION_ID: ${AZURE_SUBSCRIPTION_ID.length() > 0 ? 'Retrieved Successfully' : 'MISSING!'}"
                    echo "AZURE_CLIENT_ID: ${AZURE_CLIENT_ID.length() > 0 ? 'Retrieved Successfully' : 'MISSING!'}"
                    echo "AZURE_CLIENT_SECRET: ${AZURE_CLIENT_SECRET.length() > 0 ? 'Retrieved Successfully' : 'MISSING!'}"
                    echo "AZURE_TENANT_ID: ${AZURE_TENANT_ID.length() > 0 ? 'Retrieved Successfully' : 'MISSING!'}"
                }
            }
        }

        stage('Test Azure CLI Authentication') {
            steps {
                script {
                    echo "### Checking if Azure CLI is Installed ###"
                    sh 'az --version || echo "Azure CLI is NOT installed!"'

                    echo "### Logging into Azure with Service Principal ###"
                    sh '''
                        az login --service-principal \
                            -u $AZURE_CLIENT_ID \
                            -p $AZURE_CLIENT_SECRET \
                            --tenant $AZURE_TENANT_ID || echo "Azure login FAILED!"
                    '''
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    echo "Initializing Terraform..."
                }
                dir('terraform/environments/dev') {
                    sh 'terraform init || echo "Terraform Init FAILED!"'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    echo "Running Terraform Plan..."
                }
                dir('terraform/environments/dev') {
                    sh 'terraform plan || echo "Terraform Plan FAILED!"'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    echo "Applying Terraform Changes..."
                }
                dir('terraform/environments/dev') {
                    sh 'terraform apply -auto-approve || echo "Terraform Apply FAILED!"'
                }
            }
        }
    }

    post {
        success {
            echo 'Terraform deployment succeeded!'
        }
        failure {
            echo 'Terraform deployment failed! Please check logs above for issues.'
        }
    }
}
