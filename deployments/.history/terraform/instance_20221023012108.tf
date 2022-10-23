resource "aws_instance" "web" {
  ami                         = "${data.aws_ami.ubuntu.id}""ami-09d3b3274b6c5d4aa"
  instance_type               = "t2.micro"
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile}"
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.weatherkey.key_name}"
  user_data                   = "${file("userdata_file.sh")}"
  vpc_security_group_ids      = ["${aws_security_group.example-new1.id}"]
  availability_zone           = "us-east-1a"
  tags = {
    Name = "weater7"
  }
}
