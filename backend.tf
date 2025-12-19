terraform {
  backend "s3" {
    bucket         = "saloni-terraform-backend-state"
    key            = "jenkins/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
