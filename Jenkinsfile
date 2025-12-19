pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = "ap-south-1"
  }

  stages {

    stage('Checkout Code') {
      steps {
        checkout scm
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Validate') {
      steps {
        sh 'terraform validate'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -out=tfplan'
      }
    }

    stage('Manual Approval') {
      steps {
        input message: 'Do you want to apply Terraform changes?'
      }
    }

    stage('Terraform Apply') {
      steps {
        sh 'terraform apply tfplan'
      }
    }
  }
}
