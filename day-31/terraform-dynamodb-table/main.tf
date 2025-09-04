terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

variable "aws_region" {
  description = "AWS region to use"
  type        = string
  default     = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_dynamodb_table" "devops_users" {
  name         = "devops-users"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "devops_id"

  attribute {
    name = "devops_id"
    type = "S"
  }

  tags = {
    Project = "Nautilus"
    Owner   = "DevOps"
  }
}

output "table_name" {
  value = aws_dynamodb_table.devops_users.name
}

output "table_arn" {
  value = aws_dynamodb_table.devops_users.arn
}
