terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_opensearch_domain" "datacenter_es" {
  domain_name    = "datacenter-es"
  engine_version = "OpenSearch_1.3"
}


