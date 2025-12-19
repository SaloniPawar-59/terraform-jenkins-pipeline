provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "ap-south-1a"
}

module "web" {
  source = "./modules/ec2"

  ami           = var.ami
  instance_type = var.instance_type
  name          = "jenkins-terraform-web"

  subnet_id = module.vpc.public_subnet_id

  vpc_security_group_ids = [
    module.vpc.web_sg_id
  ]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "<h1>Hello from Jenkins + Terraform</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Env     = "dev"
    Project = "jenkins-terraform"
  }
}
