# Day 39: Creating CloudWatch Log Group & Stream with Terraform (KodeKloud Lab)

As part of my **100 Days of DevOps journey**, I worked on **automating AWS CloudWatch logging setup using Terraform**.  

On **Day 39**, the task was to **create a CloudWatch log group and log stream** using Terraform from the working directory `/home/bob/terraform`.


## Business Context

In production applications, **centralised logging** is critical for:

- **Monitoring and alerting** – track errors and events in real time  

- **Audit and compliance** – logs are stored securely for traceability  

- **Debugging and performance analysis** – developers and DevOps teams can review logs centrally  

This task ensures that logs are **structured, centralized, and easy to access**, which improves operational efficiency and reduces downtime.

## Steps & Commands

1. **Navigate to Terraform working directory**

cd /home/bob/terraform

pwd

2. **Create main.tf file**

nano main.tf

Screenshot: 02_main_tf_content.png

3. Initialise Terraform

terraform init
Screenshot: 03_terraform_init.png

4. **Validate Terraform configuration**

terraform validate
Screenshot: 04_terraform_validate.png

5. **Plan Terraform changes**

sudo terraform plan
Screenshot: 05_terraform_plan.png

6. **Apply Terraform plan**

sudo terraform apply tfplan
Screenshot: 06_terraform_apply.png

7. **Verify CloudWatch log group and stream using AWS CLI**

aws logs describe-log-groups --log-group-name-prefix devops-log-group --region us-east-1

aws logs describe-log-streams --log-group-name devops-log-group --region us-east-1
Screenshot: 07_aws_cloudwatch_verify.png


## Benefits
-Centralised logging: Easier monitoring and troubleshooting

-Automation: Ensures reproducibility of infrastructure resources

-Business value: Reduces downtime, ensures compliance, and accelerates debugging

This task demonstrates hands-on experience with Terraform, AWS CloudWatch, and infrastructure automation, critical skills for DevOps roles.
