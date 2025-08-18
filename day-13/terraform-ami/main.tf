# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-66dcad9663842d87e"
  ]

  tags = {
    Name = "nautilus-ec2"
  }
}

# Create an AMI from the EC2 instance
resource "aws_ami_from_instance" "nautilus_ami" {
  name               = "nautilus-ec2-ami"
  source_instance_id = aws_instance.ec2.id

  tags = {
    Name = "nautilus-ec2-ami"
  }
}
