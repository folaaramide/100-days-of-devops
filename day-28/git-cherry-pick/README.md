# Day 28 of 100 Days of DevOps - Managing Git Commits Across Branches (KodeKloud Lab)

On Day 28, I practiced an essential Git workflow for real-world DevOps: ensuring that only approved and specific changes make it into the production (master) branch.

This exercise simulated a common enterprise situation: a developer pushed a change to a feature branch, but only the update to info.txt was required in master. My task was to identify the correct commit, verify it, and ensure master was updated and pushed to the remote repository.

## Business Need & Essence of the Project

In production environments, not all feature work is ready for release. Sometimes, only a single critical fix or update must be promoted.

This workflow addresses the following business concerns:

1. Minimize risk: Prevents incomplete features from being merged into master.
2. Agility: Enables delivering urgent changes quickly.
3. Auditability: Git history remains clear about what was added and why.
4. Team control: Avoids uncontrolled pushes directly to production branches.
5. This is a cornerstone of change management in DevOps, balancing speed with reliability.

## Step-by-Step Execution
1️. Repository Setup and Remote Verification

I navigated to the cloned repo under /usr/src/kodekloudrepos/blog, fixed ownership warnings by marking it safe, and confirmed the remote was pointing to /opt/blog.git.

cd /usr/src/kodekloudrepos/blog

git config --global --add safe.directory /usr/src/kodekloudrepos/blog

git remote -v

📸 Suggested Screenshot: repo-layout.png — shows repo path and remote origin.

2️. Checking Out the Feature Branch

Switched to the feature branch to locate the required commit.

sudo git checkout feature

3️. Finding the Commit

Searched the commit history on feature for the change message “Update info.txt” and identified commit hash ff5d580.

sudo git log --oneline --grep="Update info.txt"

4️. Syncing the Master Branch

Switched back to master and confirmed it was already up to date with origin.

sudo git checkout master

📸 Suggested Screenshot: master-sync.png — shows master branch in sync.

5️. Updating Master with the Change

The commit was brought into master (via earlier merge work in feature). Then, I pushed master to the remote repository.

sudo git push origin master

📸 Suggested Screenshot: push-success.png — push confirmation to origin/master.

6️. Verifying the Commit in Master

I checked the latest commit history in master to confirm that Update info.txt was now part of origin/master.

sudo git log --oneline -n 3

## Benefits of the Task

Controlled changes: Only validated updates flowed into master.

Improved reliability: Reduced the chance of unfinished code reaching production.

Traceability: Git history clearly shows who authored and pushed the change.

Hands-on experience: Practiced handling “dubious ownership” warnings, syncing branches, and ensuring clean commit history.

📌 Suggested Screenshot Labels

repo-layout.png — Repo structure and remote origin.

master-sync.png — Master branch checked out and in sync.

push-success.png — Successful push of commit to origin/master.

**Takeaway: This exercise sharpened my ability to manage branch hygiene in Git — a critical DevOps skill for ensuring production reliability while still supporting fast delivery.**
