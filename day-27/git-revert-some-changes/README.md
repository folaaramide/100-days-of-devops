# Day 26 - Reverting Git Commits in Production-Like Environments
As part of my 100 Days of DevOps journey on KodeKloud, today’s focus was on Git commit management — specifically, how to revert a faulty commit safely in a shared repository.

This scenario was designed to mimic real-world DevOps work, where mistakes in code repositories must be handled carefully to ensure minimal disruption to development teams.

## Business Need
The Nautilus application development team encountered an issue with a recent commit in their repository (/usr/src/kodekloudrepos/demo). Instead of deleting history or force-resetting, the business requirement was to:

1. Safely revert the last commit (HEAD) to the previous stable commit.
2. Ensure the revert commit is traceable and auditable.
3. Use a standardized commit message (revert demo message) for clarity.

In real DevOps pipelines, this practice ensures:
-Code history remains intact for auditing.

-Developers understand what went wrong and when it was fixed.

-CI/CD pipelines continue to work without conflicts caused by force-pushes.

## Steps Taken
1. SSH into the Storage Server

Connected to the storage server (ststor01) where the Git repository is hosted.

2. Locate and Inspect the Repository

Checked the repository directory:

ls -ld /usr/src/kodekloudrepos/demo

cd /usr/src/kodekloudrepos/demo

3. Configure Git Safe Directory

Since the repo was owned by root, I added it as a safe directory:

git config --global --add safe.directory /usr/src/kodekloudrepos/demo

4. Check Current Branch and Status

Validated the branch and current state:

git branch --show-current

git status

5. View Recent Commit History

Inspected the last few commits to identify HEAD and the initial commit:

git log --oneline --decorate --graph -n 6

Result:

•	HEAD -> master : add data.txt file

•	Previous commit : initial commit

6. Revert the HEAD Commit

Reverted the latest commit without committing immediately:

sudo git revert --no-commit HEAD

7. Commit with Standardized Message

Created the revert commit with the required lowercase message:

sudo git commit -m "revert demo message"

8. Verify Revert Commit

Confirmed the new commit was created successfully:

git log --oneline --decorate --graph -n 6

9. Push Changes to Remote Repository

Synchronized local changes with the origin repository:

sudo git push origin master

10. Validate Final Repository State

Confirmed branch status and commit history aligned with requirements:

git status

git log --oneline --decorate --graph -n 6

## Outcome
•	The faulty commit was safely reverted.

•	The commit history is intact, transparent, and auditable.

•	The repo now clearly shows a revert commit (revert demo message), demonstrating proper version control discipline.

## Key Learnings

•	Revert vs Reset: Revert is the safer choice in collaborative environments since it preserves history.

•	Auditable Commits: A clear and consistent commit message policy helps track changes across distributed teams.

•	GitOps Readiness: Mastering Git commit recovery techniques is critical for production-grade CI/CD pipelines where code integrity matters.

## Recruiter Takeaway
This project reflects real-world DevOps problem-solving:

•	Working in multi-user Linux environments.

•	Applying Git version control best practices.
•	Ensuring safe collaboration without breaking CI/CD pipelines.

**This demonstrates my ability to own the lifecycle of code management in DevOps workflows.**
