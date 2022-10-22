resource "aws_key_pair" "" {
  key_name   = "example-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
