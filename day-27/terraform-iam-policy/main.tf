provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_group" "iamgroup_jim" {
  name = "iamgroup_jim"
  path = "/"
}
