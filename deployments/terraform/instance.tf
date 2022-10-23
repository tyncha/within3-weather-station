resource "aws_instance" "web" {
  ami                         = "ami-09d3b3274b6c5d4aa"
  instance_type               = "t2.micro"
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile.name}"
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.weather_key.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.example-new2.id}"]
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




