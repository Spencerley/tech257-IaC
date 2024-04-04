# create an ec2 instance

# where to create it - provide cloud name
provider "aws" {
  # which region (Ireland) to use to create a resource/service
  region = var.region
  # terraform will download all the required dependencies/plugins
  # terraform init
}
# which service

#create security group
resource "aws_security_group" "spencer_app_security_group" {
  name        = var.sg_name
  description = "Allow ssh, port 5000, 3306 and port 80"
  # three security rules
  # 1. allow ssh from local machine
  ingress {
    from_port   = var.port1
    to_port     = var.port1
    protocol    = var.protocol
    cidr_blocks = [var.cidr_block]
  }
  # 2. allow port 3000 from all
  ingress {
    from_port   = var.port2
    to_port     = var.port2
    protocol    = var.protocol
    cidr_blocks = [var.cidr_block]
  }
  #3. allow port 80 from all
  ingress {
    from_port   = var.port3
    to_port     = var.port3
    protocol    = var.protocol
    cidr_blocks = [var.cidr_block]
  }
  ingress {
    from_port   = var.port4
    to_port     = var.port4
    protocol    = var.protocol
    cidr_blocks = [var.cidr_block]
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = var.protocol
    cidr_blocks = [var.cidr_block]
  }
}


# create an ec2 instance
resource "aws_instance" "spencer_db_instance" {
  # which AMI ID:
  ami = var.app_ami_id

  # type of instance to launce
  instance_type = var.instance_type

  # please add public ip to instance
  associate_public_ip_address = var.public_ip

  # security group
  security_groups = [aws_security_group.spencer_app_security_group.name]

  # ssh key
  key_name = var.key_name

  # name service
  tags = {
    Name = var.machine_tag
  }

  user_data = <<EOF
  #!/bin/bash
    git clone https://github.com/developedbyluke/tech257-northwind-app.git repo
    cd /repo/scripts
    chmod +x db.sh
	  ./db.sh
    EOF
}

# syntax of hashi corp lang is name {key = value}

resource "aws_instance" "spencer_app_instance" {
  depends_on = [aws_instance.spencer_db_instance]
  # which AMI ID:
  ami = var.app_ami_id

  # type of instance to launce
  instance_type = var.instance_type

  # please add public ip to instance
  associate_public_ip_address = var.public_ip

  # security group
  security_groups = [aws_security_group.spencer_app_security_group.name]

  # ssh key
  key_name = var.key_name

  # name service
  tags = {
    Name = var.machine_tag
  }

  # user data app.sh
  user_data = <<EOF
  #!/bin/bash
    git clone https://github.com/developedbyluke/tech257-northwind-app.git repo
    cd /repo/scripts
    chmod +x app.sh
	  ./app.sh
  EOF
}


# automate the process of creating a github repo (could go to gitlab or bitbucket) we'll use our github
# create a new repo called tech257-multi-provider-terraform
# auth from github

# terraform {
#   required_providers {
#     github = {
#       source = "integrations/github"
#       version = "~> 5.0"
#   }
# }
# }

# provider "github" {
#   token = var.github_token

# }

# resource "github_repository" "my_repo" {
#   name = var.repo_name
#   description = "Created using Terraform"
#   visibility = var.visibility

# }
