resource "aws_key_pair" "weather_key" {
  key_name   = "weather-key2"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}