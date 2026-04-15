provider "aws" {
  region = "us-east-1"   # Mumbai region
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0f5ee92e2d63afc18"   # Amazon Linux 2 (example AMI)
  instance_type = "t2.micro"

  tags = {
    Name = "MyFirstEC2"
  }
}