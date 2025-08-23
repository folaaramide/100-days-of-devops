# Day 18: Automating AWS EBS Snapshot with Terraform


## Project Overview
As part of my 100 Days of DevOps journey, Day 18 focused on automating backups for cloud infrastructure using Terraform. The task simulated a real-world enterprise requirement: ensuring critical data volumes are automatically backed up to prevent data loss.
In this exercise, I created a **snapshot** of an existing EBS volume (devops-vol) in the us-east-1 region.

## Business Case & Benefits
1. Data Protection: Backups prevent accidental data loss.
2. Disaster Recovery: Snapshots enable fast recovery of critical infrastructure.
3. Automation & Consistency: Using Terraform ensures repeatable, error-free infrastructure management.
4. Governance: Naming and tagging snapshots supports auditing and compliance.

This project mirrors enterprise needs to maintain reliable cloud infrastructure while automating operational tasks.

## Terraform Workflow & Steps
1. Navigate to Terraform Directory

cd /home/bob/terraform

2️. Terraform Configuration (main.tf)

The complete main.tf I used:
# Provider configuration
provider "aws" {
  region = "us-east-1"
}

# Existing EBS volume
resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name = "devops-vol"
  }
}

# Create a snapshot of the existing volume
resource "aws_ebs_snapshot" "devops_snapshot" {
  volume_id   = aws_ebs_volume.k8s_volume.id
  description = "Devops Snapshot"

  tags = {
    Name = "devops-vol-ss"
  }
}
Screenshot Suggestion:
•	terraform_snapshot_main_tf.png — showing the snapshot resource added to main.tf.

3️. Initialized Terraform
terraform init
Screenshot Suggestion:
•	terraform_init.png — showing successful initialization.
________________________________________
4️. Previewed Terraform Plan
terraform plan
•	Ensure Terraform will create aws_ebs_snapshot.devops_snapshot.
Screenshot Suggestion:
•	terraform_plan_snapshot.png — showing planned snapshot creation.
________________________________________
5️. Applied Terraform Configuration
terraform apply -auto-approve
•	Terraform automatically creates the snapshot.
Screenshot Suggestion:
•	terraform_apply_snapshot.png — showing apply success message.

6️. Verified Snapshot Status

aws ec2 describe-snapshots --filters "Name=tag:Name,Values=devops-vol-ss"  --region us-east-1
•	snapshot_completed.png — showing "State": "completed" in AWS CLI output.

## Key Learnings
1. Automating cloud backups ensures data consistency and reliability.
2. Terraform simplifies infrastructure as code and enables repeatable deployments.
3. Understanding AWS EBS volumes and snapshots is critical for disaster recovery.
4. Verified snapshot creation and completion to ensure operational readiness.

## Skills Demonstrated
1. Terraform: resource creation and management
2. AWS EBS: volume and snapshot handling
3. Cloud automation and disaster recovery best practices
4. Infrastructure as code (IaC) workflow
5. Verification of cloud resources using CLI

## Conclusion
This project addresses a critical business need: automated and reliable backups of cloud infrastructure. By using Terraform to create snapshots, I ensured a repeatable, auditable, and disaster-resilient workflow.
