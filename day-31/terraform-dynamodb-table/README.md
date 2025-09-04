# Day 31 of 100 Days of DevOps/Cloud - Provisioning DynamoDB with Terraform

As part of my **100 Days of DevOps/Cloud journey**, today’s challenge (Day 31) on KodeKloud focused on using **Terraform** to provision an **AWS DynamoDB table**.  

This builds upon the previous days where I’ve automated infrastructure and deployed services with Terraform, Kubernetes, and CI/CD pipelines. Today’s task continues that flow — introducing **NoSQL data infrastructure automation**.  

## Business Context: Why DynamoDB with IaC?

In modern applications:  

- **User data** must be stored in a way that’s **scalable, secure, and cost-efficient**.  

- **DynamoDB** (serverless, NoSQL database) provides **high availability** with virtually unlimited throughput.  

- Using **Terraform (Infrastructure as Code)** ensures the setup is **repeatable, version-controlled, and auditable**, which is essential for compliance and collaboration.  

**Benefit to organizations**: No more manual console clicks. Entire environments can be recreated with a single `terraform apply`. This reduces errors, speeds up deployments, and aligns DevOps teams with **GitOps practices**.

## 🎯 Project Task

The Nautilus DevOps team required:  

1. A **DynamoDB table** named `devops-users`.  

2. The **primary key** set to `devops_id` (String).  

3. The **billing mode** to be `PAY_PER_REQUEST` (on-demand, cost-efficient).  

4. Setup must be done with **Terraform** in a single file: `main.tf`.

## Step-by-Step Implementation

### 1. Environment Setup
- Opened VS Code → Explorer → **Open in Integrated Terminal**.  

- Verified correct directory:

  pwd

  # /home/bob/terraform

Checked AWS CLI + identity:

aws sts get-caller-identity

aws configure get region

-Confirmed IAM access + default region = us-east-1.

📸 Screenshot: 01-open-in-integrated-terminal.png
📸 Screenshot: 02-aws-identity.png

2️. Terraform Configuration - main.tf

Created the main.tf with all requirements:

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
📸 Screenshot: 04-main-tf-in-editor.png

3️. Terraform Lifecycle Commands

Initialize Terraform:

terraform init

📸 Screenshot: 05-terraform-init.png

Validate syntax:

terraform validate
📸 Screenshot: 06-terraform-validate.png

Review plan:

terraform plan -out tfplan
📸 Screenshot: 07-terraform-plan.png

Apply and provision the table:

terraform apply -auto-approve
📸 Screenshot: 08-terraform-apply.png

4️. Verification

Checked DynamoDB via AWS CLI:

aws dynamodb list-tables

aws dynamodb describe-table --table-name devops-users

Output confirmed:

Table status = ACTIVE

Billing mode = PAY_PER_REQUEST

📸 Screenshot: 09-aws-list-tables.png
📸 Screenshot: 10-describe-table.png

## Key Takeaways
Business Essence: Automating DynamoDB creation saves engineering time, reduces risk, and guarantees consistency across environments.

DevOps Flow: This aligns with GitOps, where infrastructure changes are committed, reviewed, and applied consistently.

Scalability and Cost Efficiency: Using on-demand billing mode (PAY_PER_REQUEST) ensures costs scale directly with usage — perfect for unpredictable workloads.

Resume & Interview Value: Demonstrates practical hands-on skill in provisioning serverless databases with Terraform - a critical DevOps/Cloud competency.

📸 Suggested Screenshot Labels
01-open-in-integrated-terminal.png → Opening terminal in VS Code.

02-aws-identity.png → AWS identity confirmed.

04-main-tf-in-editor.png → main.tf configuration in VS Code.

05-terraform-init.png → Terra
