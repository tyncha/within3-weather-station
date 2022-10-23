locals {
  prefix = "${var.environment}-weather-station"
}



resource "aws_instance" "web" {
  ami                         = "ami-01179af28ec82e898"
  instance_type               = "t2.micro"
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile.name}"
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.weather_key.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.this.id}"]
  availability_zone           = "us-east-1a"
  user_data                   = <<EOF
  #!/bin/bash

  ## Stoping the existing docker containers if exist
  docker stop $(docker ps -aq )

  ## Starting the new docker container
  docker run -ti -d -p 80:3000 ${var.docker_image}
  EOF

  tags = {
    Name = "weather7"
    environment = var.environment
  }
}



resource "aws_key_pair" "weather_key" {
  key_name   = "${local.prefix}-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9OFQMsz1MCBDh0mFXhkF857/aX+TozfR0RCLXO8bIYBe2QDNgvq4+VJmoXe1OzvopL0xv+MgDyTLwGPuX1w/H9iCEZVHPBtZrtCMWFdIK7OwlxO3b8RvhzR3s+hM5XS5F3GFTgyrxiVGX6MgLSUkNvkINaZpyAiueYbpO/hMP1X/sPgEM5PtF6V2qz9b9F/H9Tq9757AIIZQpTTsqo7Ye/pbuIam0o41T/7Zw1NI8z8SXUjnm5jdoaKZrLvstf9piSE6hQ5PlyUm6PeW8cTynAn/zM3be3L8ETBh838F/bFoAroB+XoXZS3sdH9Udd/7o+QskfJLsRV8bBhVe1S/r tyncha@bastion-fuchicorp-com"
}



resource "aws_security_group" "this" {
  name        = "${local.prefix}-security-group"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["50.194.68.237/32"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 25
    to_port     = 25
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}