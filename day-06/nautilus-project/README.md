### Day 6 - Automating Scheduled Tasks with Cron on Nautilus App Servers

## Project Context
In my 100 Days of DevOps challenge, Day 6 was all about Linux task scheduling using cron.

This is one of the most foundational capabilities in server administration, ensuring that repetitive operational tasks run on schedule without manual intervention.

The scenario comes from the KodeKloud Nautilus Project, where I was tasked with installing and configuring cron across multiple servers, creating a simple test job to prove the setup works before production deployment.

## Business Need
In the Nautilus production environment, several automated scripts will soon be deployed to handle regular maintenance tasks, backups, log cleanup, and monitoring.

Before scheduling critical production jobs, the team needed to validate that the cron service is active and reliable on all application servers.

Key objectives:
1.	Install and activate the cron scheduling service.
2.	Add a recurring cron job for the root user.
3.	Verify the job executes successfully.

## Step-by-Step Implementation
### Step 1: Accessing the App Server
Logged into the first Nautilus app server via SSH and confirmed the operating system to determine the right package manager.

ssh tony@stapp01
cat /etc/os-release

📷 Screenshot: screenshot/ssh-login-app01.png
📷 Screenshot: os_check_app01.png

### Step 2: Installing Cronie
On CentOS, cron is provided by the cronie package.

sudo yum install -y cronie
📷 Screenshot: screenshot/install-cronie-app01.png

### Step 3: Enabling and Starting crond
Enabled the cron daemon to start immediately and on every boot.

sudo systemctl enable --now crond
sudo systemctl status crond
📷 Screenshot: screenshot/crond-tatus-app01.png

### Step 4: Adding the Test Cron Job via vi
Opened the root crontab in vi:

sudo crontab -u root -e
Inside vi, I inserted the following line at the bottom:

*/5 * * * * /bin/echo hello > /tmp/cron_text
Then I saved and exited (:wq in vi).

📷 Screenshot: screenshot/root-crontab-edit-vi.png
📷 Screenshot: 05-root-crontab-after-app1.png

### Step 5 - Verifying the Job
Waited for at least 5 minutes for the schedule to trigger, then confirmed the file content:

cat /tmp/cron_text

Output:

nginx

hello
📷 Screenshot: 06_cron_output_file_app1.png

##  Outcome
•	Cron service installed and running on all Nautilus app servers.
•	Root-level cron job successfully scheduled via manual vi edit.
•	Test confirmed that the job executes every 5 minutes and outputs "hello" into /tmp/cron_text.

## Skills Demonstrated
•	Linux service management with systemctl
•	CentOS package installation with yum
•	Editing and managing crontabs with vi
•	Task scheduling with cron
•	Verifying job execution via command-line

## Reflection
Today’s exercise reinforced the importance of testing before deploying in operations.

Even something as simple as writing "hello" to a file serves as a powerful proof that the scheduling system works as intended — a critical first step before entrusting it with production workloads.
