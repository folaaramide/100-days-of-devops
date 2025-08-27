## Day 22 – Creating a Public S3 Bucket with Terraform
As part of my AWS + Terraform learning journey, I worked on creating a public S3 bucket named nautilus-s3-11414. The goal of this lab was to define everything in Terraform (main.tf), deploy it, and then verify using the AWS CLI.

This task mimics what a DevOps engineer would do during a data migration to AWS - provisioning secure, correctly configured storage buckets with Infrastructure as Code.

## Terraform configuration (using aws_s3_bucket, aws_s3_bucket_acl, and aws_s3_bucket_public_access_block resources):

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "nautilus_bucket" {
  bucket = "nautilus-s3-11414"

  tags = {
    Name        = "nautilus-s3-11414"
    Environment = "DevOps-Migration"
  }
}

resource "aws_s3_bucket_acl" "nautilus_bucket_acl" {
  bucket = aws_s3_bucket.nautilus_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "nautilus_bucket_block" {
  bucket                  = aws_s3_bucket.nautilus_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

## Terraform Workflow
1. Initialize Terraform
terraform init
📸 Screenshot suggestion: terminal showing successful terraform init.

2️2. Validate Configuration

terraform validate

•	Ensures no syntax errors.

📸 Screenshot suggestion: terminal with “Success! The configuration is valid.”

3️. Plan the Changes

terraform plan

•	Previewed creation of the new bucket.

📸 Screenshot suggestion: highlighted section of Terraform plan showing + aws_s3_bucket.nautilus_bucket.

4️. Apply Configuration

terraform apply

•	Confirmed with yes.

•	Bucket nautilus-s3-11414 created successfully in us-east-1.

📸 Screenshot suggestion: Terraform apply output with “Apply complete!”.

5️. Show the State

terraform show

•	Inspected Terraform state to confirm bucket properties.

📸 Screenshot suggestion: snippet of terraform show output displaying bucket details.

**AWS CLI Verification**
After Terraform created the bucket, I switched to AWS CLI to verify.

6. List Buckets
aws s3 ls | grep nautilus-s3-11414

•	Bucket appeared in the list.
📸 Screenshot suggestion: AWS CLI output showing the bucket name.

7️. Check Bucket ACL
aws s3api get-bucket-acl --bucket nautilus-s3-11414

•	Saw the ACL details, confirming public-read.

•	Stopped the lab here (next steps would have been checking policy status, uploading a file, and testing public access).

|📸 Screenshot suggestion: JSON ACL output showing "Permission": "READ".

## Key Learnings

•	Terraform + AWS: Learned how to provision AWS S3 buckets in a repeatable, codified way.

•	Deprecations in Terraform: Adjusted to the new best practices (aws_s3_bucket_acl instead of inline ACLs).

•	Verification process: Used both terraform show and aws cli commands to confirm infrastructure state.
