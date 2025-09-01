# Day 26 - Provision an IAM user with Terraform (iamuser_javed)
Continuing my 100 Days of DevOps / Cloud journey, Day 26 focused on one of the most important foundations of cloud security: Identity and Access Management (IAM).

I automated the creation of an IAM user (iamuser_javed) using Terraform from the working directory /home/bob/terraform.

This README tells the story of the task (what I did), why it matters to the business, the exact commands I ran, verification steps, and suggested screenshots you can use on GitHub and LinkedIn.

## What I built
•	Created an IAM user named iamuser_javed with Terraform (single main.tf file)

•	Followed Terraform workflow: init → validate → plan → apply

•	Verified user exists with AWS CLI (aws iam get-user, aws iam list-users)

•	Skills demonstrated: Terraform (IaC), AWS IAM, secure automation, verification, tagging & auditability

## Business need & project essence
Why this matters (business view):

•	IAM is the gatekeeper for cloud resources. Organizations must create identities (users, roles), apply least-privilege access, and track who has access.

•	Automating IAM with Terraform ensures consistency, auditability, and repeatability — vital in regulated or production environments.

•	Tagging users (Owner, Project, Name) improves asset tracking, billing attribution, and governance for security audits.

**The exact main.tf I used**
I copied this into /home/bob/terraform/main.tf (only file):

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

## Business essence (for this code):
•	provider block points Terraform to the AWS region (IAM is global, region is harmless).
•	aws_iam_user resource creates a managed identity with tags — enabling governance and traceability.

## Step-by-step commands (run in /home/bob/terraform)

Below I list the steps I followed, why each step matters, and which screenshot to capture.

1) Verify user & working directory

pwd

ls -ld /home/bob/terraform

Why: Confirm you’re bob and inside the correct Terraform working folder; Ensures actions are taken in the correct environment & by the correct user (accountability).

2) Check directory permissions
ls -ld /home/bob/terraform

Why: Confirm you have write access. If root-owned, either use sudo for failing commands or fix only when permitted; Avoids accidental permission changes that could affect other lab assets or production systems.

3) Create main.tf (ONLY file)

Use vi, cat > main.tf <<'EOF' ... EOF, or paste into VS Code. Ensure the content matches the main.tf above.

Command (example):

cat > main.tf <<'EOF'

...paste main.tf content

EOF

Business note: Single-file IaC makes grading deterministic and shows discipline in packaging changes.

4) Format & initialize Terraform

terraform fmt

terraform init

Why: fmt standardizes formatting. init bootstraps provider plugins.

Business note: Initialization is the start of a reproducible pipeline; ensures providers are locked and cached.

5) Validate the config

terraform validate

Why: Catches syntax/errors early before applying changes; Reduces drift and failed applies in CI pipelines.

6) Plan the changes

terraform plan -out=plan.out

Why: Shows what will change without applying it. A best practice for review/approval; This is where code reviews / security approvals happen in production workflows.

7) Apply the plan (create the user)

terraform apply -auto-approve plan.out

Why: Actually creates the IAM user; Demonstrates safe, repeatable deployment of identity resources via IaC.

8) Verify with AWS CLI

aws iam get-user --user-name iamuser_javed --output table

aws iam list-users | grep iamuser_javed

Why: Confirms the user exists and shows ARN, creation date, and tags; Verification closes the loop — audit evidence that infrastructure changes were successful.

9) (Optional) Destroy / cleanup

If there is need to remove the resource:

terraform destroy -auto-approve

Business note: Cleanup is important in shared lab or cost-sensitive environments. Demonstrates responsibility.
