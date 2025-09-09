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

resource "aws_sns_topic" "nautilus_notifications" {
  name = "nautilus-notifications"

  tags = {
    Environment = "DevOpsLab"
    Team        = "Nautilus"
  }
}
