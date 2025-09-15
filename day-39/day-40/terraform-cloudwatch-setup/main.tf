provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudwatch_log_group" "devops_log_group" {
  name = "devops-log-group"
}

resource "aws_cloudwatch_log_stream" "devops_log_stream" {
  name           = "devops-log-stream"
  log_group_name = aws_cloudwatch_log_group.devops_log_group.name
}
