resource "aws_instance" "web" {
  ami                         = "ami-09d3b3274b6c5d4aa"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair..key_name}"
  user_data                   = "${file("userdata_file.sh")}"
  vpc_security_group_ids      = ["${aws_security_group.example1.id}"]
  availability_zone           = "us-east-1a"
}

resource "aws_instance" "web2" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
}

