# create an ec2 instance

# where to create it - provide cloud name
provider "aws" {
  # which region (Ireland) to use to create a resource/service
  region = "eu-west-1"
  # terraform will download all the required dependencies/plugins
  # terraform init
}
# which service

#create security group
resource "aws_security_group" "app_security_group" {
  name        = "tech257-spencer-terraform-app-sg"
  description = "Allow ssh, port 3000 and port 80"
  # three security rules
  # 1. allow ssh from local machine
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # 2. allow port 3000 from all
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #3. allow port 80 from all
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# create an ec2 instance
resource "aws_instance" "app_instance" {
  # which AMI ID: ami-02f0341ac93c96375
  ami = "ami-02f0341ac93c96375"

  # type of instance to launce
  instance_type = "t2.micro"

  # please add public ip to instance
  associate_public_ip_address = true

  # security group
  security_groups = [aws_security_group.app_security_group.name]


  # ssh key
  key_name = "tech257"

  # name service
  tags = {
    Name = "tech257-spencer-terraform-app"
  }

}
# syntax of hashi corp lang is name {key = value}
