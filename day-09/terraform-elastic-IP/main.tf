provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "datacenter_eip" {
  tags = {
    Name = "datacenter-eip"
  }
}
