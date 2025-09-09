# Day 35: Creating an AWS SNS Topic with Terraform
Today’s challenge on my 100 Days of DevOps (KodeKloud Labs) was to create an AWS SNS topic named nautilus-notifications using Terraform.

## Business Need & Essence
•	Modern applications often need real-time notifications for events such as alerts, user actions, or operational messages.

•	AWS SNS (Simple Notification Service) provides a reliable, scalable messaging service to push notifications to multiple subscribers (email, SMS, Lambda, SQS).

•	Automating SNS topic creation using Terraform ensures repeatability, version control, and reduced manual errors, which is critical for enterprise-grade infrastructure.

## Business benefits of this task:
-Consistent infrastructure provisioning

-Reproducibility across multiple environments

-Easy maintenance and collaboration for DevOps teams

-Reliable notification delivery to support monitoring and operational workflows

## Step-by-Step Implementation
Server: iac-server (Terraform working directory: /home/bob/terraform)

Step 1: Create main.tf
vi main.tf
📸 Screenshot suggestion: 01-main-tf.png → show full main.tf

Step 2: Format & Validate

terraform fmt        # format the Terraform code

terraform validate   # validate syntax
📸 Screenshot suggestion: 02-terraform-validate.png → show successful validation

Step 3: Initialise Terraform

terraform init

•	Downloads provider plugins

•	Prepares working directory
📸 Screenshot suggestion: 03-terraform-init.png → show provider initialization

Step 4: Plan the Deployment

terraform plan -out=tfplan

•	Preview what will be created

•	Save the plan for apply
📸 Screenshot suggestion: 04-terraform-plan.png → show plan for SNS topic creation

Step 5: Apply the Plan

terraform apply -auto-approve tfplan

•	Creates the SNS topic in AWS
📸 Screenshot suggestion: 05-terraform-apply.png → show resource creation

Step 6: Verify Deployment

terraform plan

aws sns list-topics --region us-east-1

•	Ensure Terraform state matches reality

•	Confirm SNS topic nautilus-notifications exists
📸 Screenshot suggestions:
•	06-terraform-plan-no-changes.png → Terraform reports no changes
•	07-aws-sns-list.png → SNS topic exists in AWS

## Key Learnings & Benefits
•	Learned to provision AWS SNS topics declaratively using Terraform

•	Reinforced Terraform workflow: init → validate → plan → apply → verify

•	Understood tags and metadata to help organize infrastructure

•	Applied IaC best practices: repeatable, version-controlled, and automated infrastructure provisioning
________________________________________
Suggested PNG Screenshots
For GitHub README:
1.	01-main-tf.png → main.tf content
2.	02-terraform-validate.png → validation output
3.	03-terraform-init.png → init output
4.	04-terraform-plan.png → plan showing SNS topic creation
5.	05-terraform-apply.png → apply output
6.	06-terraform-plan-no-changes.png → final plan with no changes
7.	07-aws-sns-list.png → SNS topic confirmed
For LinkedIn (short summary):
1.	li-01-overview.png → apply + final plan showing no changes
2.	li-02-main-tf.png → snippet of main.tf showing topic name & tags
