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
  name = var.sg_name
  description = "Allow ssh, port 3000 and port 80"
  # three security rules
  # 1. allow ssh from local machine
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # 2. allow port 3000 from all
  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #3. allow port 80 from all
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# create an ec2 instance
resource "aws_instance" "app_instance" {
  # which AMI ID:
  ami = var.app_ami_id

  # type of instance to launce
  instance_type = var.instance_type

  # please add public ip to instance
  associate_public_ip_address = var.public_ip

  # security group
  security_groups = [aws_security_group.app_security_group.name]


  # ssh key
  key_name = var.key_name

  # name service
  tags = {
    Name = var.machine_tag
  }

}
# syntax of hashi corp lang is name {key = value}
