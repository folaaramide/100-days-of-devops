# 100 Days of DevOps: Day 6 – Automated Website Backup Script

## Project Overview

As part of my **100 Days of Cloud and DevOps journey** on KodeKloud, I implemented an automated **website backup solution** for an enterprise environment. This script is designed for **xfusioncorp Industries**, a fictitious enterprise, to ensure that their critical web content is reliably backed up and replicated to a central backup server.

In this project, the focus was on creating a **bash script** that automates the backup of a static website hosted on **App Server 3** and pushes it to a remote **Nautilus Backup Server**. This task mirrors real-world enterprise requirements for **business continuity, data protection, and operational automation**.

## Business Value

1. **Data Protection & Redundancy:**  
   Backups of production web content ensure that in the event of data loss, website functionality can be restored quickly.

2. **Operational Efficiency:**  
   Automating backups reduces manual workload for the production support team, minimizing human error.

3. **Enterprise-Grade Implementation:**  
   Using **passwordless SSH and centralized backup storage** demonstrates best practices for secure and scalable operations.

## Features of the Script

- Creates a zip archive of the `/var/www/html/news` directory.
- Stores the archive temporarily under `/backup/` on the application server.  
- Copies the archive to a remote backup server **without requiring passwords** (using SSH key-based authentication).  
- Logs success messages upon completion.  
- Re-runnable without conflicts (overwrites previous backup).

## Business Need

In production environments, data loss prevention is critical. For xFusionCorp’s web operations:

-Website uptime is tied directly to brand reputation.

-Regular backups protect against accidental deletions, configuration issues, or system failures.

-Centralized storage ensures that even if a local server is compromised, the latest backup is safe.

-Without automation, backups are prone to:

-Human error (missed backups)

-Inconsistent file versions

-Time-consuming manual interventions

-The backup script ensures:

-Consistency – The same process runs every time.

-Speed – No more manual zipping, transferring, and re-verifying.

-Security – Passwordless transfer reduces human involvement without exposing credentials.

## Troubleshooting & Challenges

This task looked straightforward on paper, but in practice:

The zip utility wasn’t installed on the CentOS-based KodeKloud environment.

-Solution: Installed via yum install zip -y after identifying missing package errors.

-SSH key setup needed to be configured to allow passwordless SCP between servers.

-Correct directory permissions had to be validated to ensure both script execution and archive creation.
## Execution Workflow

-[banner@stapp03]$ /scripts/news_backup.sh
![Screenshot](assets/screenshot.png)


-updating: var/www/html/news/ (stored 0%)

-updating: var/www/html/news/index.html (stored 0%)

-xfusioncorp_news.zip                                    100%  588     1.6MB/s   00:00

-Backup successful on stbkp01

-[banner@stapp03]$ ssh clint@stbkp01 "ls -lh /backup/xfusioncorp_news.zip"

-rw-r--r-- 1 clint clint 588 Aug 13 23:13 /backup/xfusioncorp_news.zip

Screenshots
1.	news_source_files.png – Source website files
2.	backup_dir.png – Backup directory confirmation
3.	script_execution.png – Running the backup script
4.	backup_local.png – Local backup archive
5.	backup_remote.png – Remote backup confirmation
________________________________________
Tools & Technologies
•	Bash scripting
•	Linux file system operations
•	zip utility for compression
•	SSH & SCP for secure remote copy
•	Passwordless SSH authentication (RSA keys)
________________________________________
Summary
This project demonstrates automation, security, and reliability in an enterprise DevOps context. Troubleshooting issues like missing zip packages and SSH key setup provided hands-on exposure to real-world operational challenges. It adds tangible value to the 100 Days of DevOps journey by showcasing problem-solving, scripting, and backup automation.
