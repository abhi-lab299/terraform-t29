provider "aws" {
  region = "sa-east-1"  
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-076742b894530ab1f"  
  instance_type = "t3.small"
  tags = {
    Name = "MyTerraformEC2"
  }
}
