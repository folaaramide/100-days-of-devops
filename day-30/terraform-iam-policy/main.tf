terraform {
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

# Build the read-only EC2 policy document
data "aws_iam_policy_document" "ec2_read_only" {
  statement {
    sid    = "EC2ReadOnly"
    effect = "Allow"

    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceStatus",
      "ec2:DescribeImages",
      "ec2:DescribeSnapshots",
      "ec2:DescribeVolumes",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeTags",
      "ec2:DescribeKeyPairs",
      "ec2:DescribeAddresses",
      "ec2:DescribeRegions",
      "ec2:DescribeAvailabilityZones"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "iampolicy_ravi" {
  name        = "iampolicy_ravi"
  description = "Read-only EC2 console access (view instances, AMIs, snapshots)"
  policy      = data.aws_iam_policy_document.ec2_read_only.json
}
