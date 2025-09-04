# Day 30 - IAM Policy with Terraform (KodeKloud Lab)

As part of my **[100 Days of DevOps](https://github.com/folaaramide/100-days-of-devops)** journey, I completed a Terraform lab focused on **AWS Identity and Access Management (IAM)**.

## Business Context

When setting up infrastructure in the cloud, **Identity and Access Management (IAM)** is among the first - and most critical - services to configure.  

- Businesses need to **control who can do what** in AWS.  

- Teams require **read-only policies** for auditing, troubleshooting, or giving developers safe visibility into resources.  

- Following the **principle of least privilege** reduces the risk of accidental changes and ensures compliance with security standards.  

In this task, I was asked to create a **read-only IAM policy** that grants access to view Amazon EC2 resources (instances, AMIs, snapshots) in the AWS console.

## Technical Implementation

- **Tooling:** Terraform (Infrastructure as Code).  

- **Region:** `us-east-1`.  

- **Resource:** `aws_iam_policy` named `iampolicy_ravi`.  

- **Permissions:** Read-only access to EC2 console actions.  

The lab specifically required all work to be done in a single file: `/home/bob/terraform/main.tf`.

### Step 1: Prepare Working Directory
pwd

vi main.tf

ls -la

find . -maxdepth 1 -type f -name "*.tf" -print
📸 Screenshot: D30_01_directory_setup.png – showing only main.tf in /home/bob/terraform.

Step 2: Write the main.tf
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
📸 Screenshot: D30_02_main_tf_editor.png – showing the main.tf open in VS Code.

Step 3: Initialize Terraform
terraform fmt

terraform init

terraform validate
📸 Screenshot: D30_03_init_validate.png – output of terraform init and terraform validate.

Step 4: Plan and Apply

terraform plan -out=tfplan

terraform apply -auto-approve
📸 Screenshot: D30_04_plan_apply.png – Terraform apply showing creation of the policy.

Step 5 : Verify in Terraform State

terraform state list

terraform state show aws_iam_policy.iampolicy_ravi
📸 Screenshot:
•	D30_05_state_list.png – list of resources in state.
•	D30_06_state_show.png – showing the policy ARN and JSON document.

## Outcome
•	Created IAM policy iampolicy_ravi in us-east-1.

•	Policy grants read-only access to EC2 console resources (instances, AMIs, snapshots).

•	Validated with Terraform state (CLI verification not required by the lab).

•	Followed Infrastructure as Code practices — policy definition is version-controlled and reproducible.

## Benefits of This Task
•	For Security: Implements least privilege by granting only read-only access.

•	For Business: Ensures compliance, reduces accidental misconfigurations, and allows safe visibility for non-admin users.

•	For DevOps Practice: Reinforces using Terraform to manage IAM consistently across environments.
