
provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudformation_stack" "devops" {
  name = "devops-stack"

  template_body = <<TEMPLATE
AWSTemplateFormatVersion: '2010-09-09'
Description: 'CloudFormation stack to create S3 bucket with versioning enabled'
Resources:
  DevOpsBucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: devops-bucket-13113
      VersioningConfiguration:
        Status: Enabled
TEMPLATE
}
