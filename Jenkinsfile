pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"
    }

    stages {


        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Approval') {
            steps {
                input message: 'Approve Terraform Apply?', ok: 'Apply'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

    }

    post {
        success {
            echo 'Infrastructure provisioned successfully'
        }
    }
}
