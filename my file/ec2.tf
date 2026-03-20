provider "aws" {
  region = "sa-east-1"  
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-076742b894530ab1f"  
  instance_type = "t3.small"
  key_name = "pair-key"   # 
  vpc_security_group_ids = ["sg-03bd0f9b90c633808"]
  tags = {
    Name = "MyTerraformEC2"
  }
}