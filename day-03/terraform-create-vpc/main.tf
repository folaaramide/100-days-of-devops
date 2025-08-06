provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "nautilus" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "nautilus" {
  key_name   = "nautilus-kp"
  public_key = tls_private_key.nautilus.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.nautilus.private_key_pem
  filename        = "/home/bob/nautilus-kp.pem"
  file_permission = "0600"
}
