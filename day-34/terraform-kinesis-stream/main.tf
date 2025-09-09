terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_kinesis_stream" "devops_stream" {
  name             = "devops-stream"
  shard_count      = 1
  retention_period = 24

  tags = {
    Name = "devops-stream"
    Team = "DevOps"
  }
}
