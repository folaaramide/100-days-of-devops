# Day 27 of 100 Days of DevOps: IAM Group Management with Terraform
As part of my 100 Days of DevOps journey, I’ve been exploring how enterprises use Infrastructure as Code (IaC) to provision cloud resources in a reliable, repeatable way.

On Day 27, I focused on creating and managing AWS IAM groups using Terraform. This task builds upon my earlier IAM user work (Day 26) and continues to demonstrate how IAM can be codified, version-controlled, and scaled efficiently in real-world environments.

## Business Need
In large organizations, multiple teams (developers, testers, admins) require different sets of permissions. Instead of assigning permissions individually to each user (which is error-prone and hard to manage at scale), IAM groups are created.

•	Groups improve security by centralizing policy management.

•	Groups improve scalability — adding/removing users is just one command.

•	Groups reduce risk of misconfigured permissions.

By automating IAM group creation with Terraform, the DevOps team ensures consistency across environments (development, staging, production), which is essential for compliance and governance.

## Task Requirements

•	Create an IAM group named iamgroup_jim.

•	Use Terraform as the IaC tool.

•	Perform all work in the directory: /home/bob/terraform.

•	Ensure the Terraform configuration is valid, applied, and verifiable.

## Step-by-Step Implementation
1️. Navigate to the working directory

cd /home/bob/terraform

2. Create the main.tf file

The main.tf file defines the AWS provider and the IAM group resource.

provider "aws" {

  region = "us-east-1"

}

resource "aws_iam_group" "iamgroup_jim" {

  name = "iamgroup_jim"
  
  path = "/"

}

3. Initialize Terraform

terraform init

This downloads the AWS provider and sets up the backend.

4️. Validate configuration

terraform validate

Should return: Success! The configuration is valid.

5. Generate an execution plan

terraform plan -out=plan.out

This shows the expected creation of iamgroup_jim.

6. Apply the configuration

terraform apply -auto-approve plan.out

Terraform provisions the IAM group in AWS.

7️. Verify the IAM group

aws iam get-group --group-name iamgroup_jim --output table

Expected result: Table output with iamgroup_jim details.

8. Outcome

•	Successfully created IAM group iamgroup_jim.

•	Confirmed group existence via both Terraform state and AWS CLI.

•	Validated that the DevOps team can now manage user access at scale by associating IAM users with this group.

## Benefits of This Approach
1.	Automation → No manual AWS Console clicks.

2.	Consistency → Same Terraform code can be applied across dev/test/prod.

3.	Security & Compliance → Centralized control over access groups.

4.	Scalability → Adding new team members is as easy as assigning them to the group.

**Day 27 Takeaway: This task reinforced the importance of Infrastructure as Code in IAM security management. By codifying groups with Terraform, I’ve taken another step toward mastering cloud governance and access control automation.**
