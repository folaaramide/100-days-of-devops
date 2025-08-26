# Day 21 of 100 Days of DevOps — Git Repository Setup on Storage Server
As part of my 100 Days of DevOps journey, today I worked on a task from the Nautilus project team that reflects a real-world infrastructure & application lifecycle requirement.

## Business Need & Essence
The Nautilus development team is building a new application and needs a centralized Git repository to manage source code efficiently.

From a business perspective:

•	Git ensures version control, enabling collaboration across distributed teams.

•	A bare repository on the Storage Server allows developers to push & pull code without conflicts.

•	Having this hosted in the Stratos DC aligns with security, reliability, and scalability requirements.

This task demonstrates the foundation of DevOps workflows: setting up the right tools and infrastructure to enable smooth CI/CD pipelines later on.

## Steps & Implementation
All steps were carried out on the Storage Server (ststor01) as user natasha.

1. Install Git

First, I confirmed that Git was installed on the storage server.

git --version

git version 2.47.3

2️. Create the Bare Repository

The requirement was to create a bare Git repository named exactly /opt/news.git.

sudo git init --bare /opt/news.git

Output showed successful initialization:

Initialized empty Git repository in /opt/news.git/

3️. Verify Repository Structure

List the repository directory to confirm the expected structure:

ls -l /opt/news.git

Output included folders like branches/, hooks/, objects/, refs/, confirming bare repo layout.

4️. Double Check it is Bare

To remove any doubt, I ran:

git --git-dir=/opt/news.git rev-parse --is-bare-repository

Output:

true

This confirms the repository was initialized as bare (no working directory).

5️. Permissions Check

Lastly, checked permissions to ensure accessibility:

ls -ld /opt/news.git

Output showed: drwxr-xr-x 7 root root ...

📸 Suggested Screenshots
For GitHub README and LinkedIn post:
1.	Git Installation Check → screenshot of git --version
o	Save as: day20_git_version.png
2.	Repository Creation → screenshot of git init --bare /opt/news.git output
o	Save as: day20_repo_init.png
3.	Repo Structure → screenshot of ls -l /opt/news.git
o	Save as: day20_repo_structure.png
4.	Bare Repo Verification → screenshot of rev-parse output
o	Save as: day20_repo_verify.png
5.	Final Permissions → screenshot of ls -ld /opt/news.git
o	Save as: day20_repo_permissions.png

## Reflection & Benefits

By completing this task, I:

•	Reinforced my understanding of bare repositories in Git and why they matter in team setups.

•	Experienced setting up infrastructure in a production-like environment.

•	Saw firsthand how simple, but precise configurations are critical for avoiding failures in DevOps tasks.

This project is a building block for future CI/CD pipelines, where code will flow from developers → Git → automated testing → deployment.
