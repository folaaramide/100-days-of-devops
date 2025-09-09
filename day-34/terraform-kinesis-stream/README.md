# Day 34: Creating AWS Kinesis Stream with Terraform
Today’s challenge was to deploy an AWS Kinesis Data Stream named devops-stream using Terraform, following best practices for IaC.

This stream is critical for real-time data ingestion, which can then be consumed by downstream applications for analytics, monitoring, and operational insights.

## Business Need & Essence
Modern applications need real-time data processing for tasks such as:

•	Streaming logs or telemetry data for monitoring and alerting

•	Analytics on live data for business intelligence

•	Triggering workflows based on events in near real-time

By using Terraform to provision Kinesis streams:

•	Infrastructure is declarative and reproducible

•	Configurations can be version-controlled

•	Teams can avoid manual AWS console operations, reducing errors and ensuring consistency

## Step-by-Step Implementation

Server: iac-server (Terraform working directory /home/bob/terraform)

Step 1: Create main.tf
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
📸 Screenshot: 01-main-tf.png → terminal showing cat main.tf

Step 2: Format & Validate Terraform

terraform fmt        # formats main.tf

terraform validate   # checks syntax & configuration correctness
📸 Screenshot: 02-terraform-validate.png → showing no errors

Step 3: Initialise Terraform

terraform init

•	Downloads provider plugins

•	Prepares working directory

📸 Screenshot: 03-terraform-init.png → terminal showing provider plugin download

Step 4: Plan the deployment

terraform plan -out=tfplan

•	Shows what resources will be created

•	Saves the plan as tfplan
📸 Screenshot: 04-terraform-plan.png → terminal showing resource creation plan

Step 5: Apply the Terraform plan

terraform apply -auto-approve tfplan

•	Creates the Kinesis stream in AWS

📸 Screenshot: 05-terraform-apply.png → terminal showing stream created

Step 6: Verify the deployment

terraform plan    # should show: No changes. Your infrastructure matches the configuration.

aws kinesis describe-stream --stream-name devops-stream --region us-east-1 --no-paginate

•	Confirms the stream exists and is ACTIVE
📸 Screenshots:
•	06-terraform-plan-no-changes.png → showing no changes
•	07-aws-describe-stream.png → stream details output
________________________________________
Step 7: Reapply if tags were missing
•	Sometimes the second terraform plan shows 1 update in-place due to tags

•	Run:

terraform apply -auto-approve

terraform plan

•	Ensure final state shows No changes. Your infrastructure matches the configuration.
📸 Screenshot: 08-final-no-changes.png

## Key Learnings & Benefits
•	Practiced Terraform workflow: init → validate → plan → apply → verify

•	Learned to manage AWS Kinesis streams declaratively

•	Understood tagging and resource drift detection

•	Reinforced IaC best practices: version control, reproducibility, and minimal manual intervention

## Business value:

•	Reduces operational errors in real-time data pipelines

•	Enables scalable and reliable streaming data architecture

•	Supports downstream analytics and near-real-time decision-making

📂 Project Files
•	/home/bob/terraform/main.tf (see above)
________________________________________
🔗 Social Links
•	💼 LinkedIn – Afolabi Aramide
•	📂 GitHub Repository – 100 Days of DevOps
________________________________________
Suggested PNG Screenshots
For GitHub README:
1.	01-main-tf.png → showing main.tf content
2.	02-terraform-validate.png → validation output
3.	03-terraform-init.png → init output
4.	04-terraform-plan.png → initial plan
5.	05-terraform-apply.png → apply output
6.	06-terraform-plan-no-changes.png → final plan with no changes
7.	07-aws-describe-stream.png → Kinesis stream details
8.	08-final-no-changes.png → second plan confirming drift fixed
For LinkedIn:
1.	li-01-overview.png → combined apply + no changes output
2.	li-02-main-tf.png → snippet showing stream name & tags
________________________________________
This README continues the story of your 100 Days of DevOps by showing progression from Kubernetes tasks to cloud IaC tasks using Terraform — highlighting real-world business value like reproducibility, reliability, and automated infrastructure provisioning.
