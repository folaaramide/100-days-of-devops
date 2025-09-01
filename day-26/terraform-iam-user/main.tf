provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "iamuser_javed" {
  name = "iamuser_javed"
  path = "/"
  tags = {
    Name    = "iamuser_javed"
    Owner   = "bob"
    Project = "100-days-of-devops"
  }
}
