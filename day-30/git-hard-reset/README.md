# Day 30 - Git Commit History Rewrite (KodeKloud Lab)
As part of my 100 Days of DevOps challenge, I completed a lab on KodeKloud that focused on resetting and rewriting Git commit history.

This task simulated a real-world DevOps challenge:

A developer pushed several test commits into a shared repository. As a DevOps engineer, I was asked to clean the repository, preserving only the initial commit and the commit that added the data.txt file, and then update the remote repository to reflect the clean history.

## Business Context
In enterprise environments:

•	Messy commit history reduces code readability and complicates auditing.

•	Test commits or accidental pushes increase repository noise.

•	Auditors and compliance teams often require repositories to have meaningful, traceable commit history.

•	CI/CD pipelines depend on clean history for reproducible builds.

By learning how to rewrite history responsibly (and when it’s appropriate), I strengthened skills that directly support:

•	Code maintainability.

•	Collaboration between development and operations.

•	Business agility (teams can trust the state of repositories).

## Technical Walkthrough
I performed this task on the Storage server in Stratos DC inside the KodeKloud environment.

Step 1 - Inspect repository state

git status

git remote -v

git branch -vv

git --no-pager log --oneline --graph --decorate --all -20

•	Confirmed branch master.

•	Remote: /opt/news.git.

•	Found 11 noisy commits, including the ones we want:

o	c7506cf initial commit

o	080f110 add data.txt file
📸 Screenshot suggestion:
•	01-repo-status.png – showing git status and git branch -vv.
•	02-log-before.png – showing the long commit history.

Step 2 - Reset to initial commit

git reset --hard c7506cf

•	Brought the branch back to its very first commit.
📸 Screenshot suggestion:
•	03-reset-hard.png – output of reset and a short log showing only the initial commit.

Step 3 – Cherry-pick the meaningful commit

git cherry-pick 080f110

•	Applied the changes from the add data.txt file commit onto the reset branch.

•	This produced a new commit e6a5233 add data.txt file.
📸 Screenshot suggestion:
•	04-cherry-pick.png – showing successful cherry-pick.

Step 4 – Verify clean history

git --no-pager log --oneline --graph --decorate -2

Result: only two commits remain:

e6a5233 add data.txt file

c7506cf initial commit
📸 Screenshot suggestion:
•	05-log-after.png – clean 2-commit history.

Step 5 – Push changes safely

git push --force-with-lease origin master

•	Updated remote repository to match the cleaned history.

•	Verified with:

git log origin/master --oneline -2
📸 Screenshot suggestion:
•	06-push-force.png – output of force push.
•	07-remote-verify.png – remote branch log confirming two commits only.

## Outcome
•	Local and remote repositories now show a minimal, clean commit history.

•	Demonstrated safe use of git reset, git cherry-pick, and git push --force-with-lease.

•	Practiced rollback awareness (via git reflog) in case recovery is needed.

## Benefits of This Exercise
•	For Developers: Easier to review code history and understand meaningful changes.

•	For DevOps Engineers: Builds confidence in handling Git operations that impact shared repositories.

•	For Businesses: Clean history supports compliance, reduces risk of errors, and improves developer productivity.

## Key Takeaways
•	Not every Git rewrite is dangerous — with the right workflow (--force-with-lease, backups, reflog), it can be done responsibly.

•	This skill is essential in DevOps pipelines, especially when enforcing quality and compliance in version control.

•	Day 30 reinforces the importance of discipline in source control — a critical foundation for CI/CD and cloud-native DevOps practices.

📸 Screenshot Index
Step	Screenshot	Description
1	01-repo-status.png	Repo status & branch details
2	02-log-before.png	Original long commit history
3	03-reset-hard.png	Reset branch to initial commit
4	04-cherry-pick.png	Cherry-pick successful
5	05-log-after.png	Clean two-commit history
6	06-push-force.png	Force push to remote
7	07-remote-verify.png	Remote commit log verification
