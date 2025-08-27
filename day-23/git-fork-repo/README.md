# Day 23 - Forking a Git Repository in Gitea (KodeKloud Lab)
## Scenario:
The Nautilus project uses a Gitea Git server for collaboration. A new developer, Jon, needs to start working on a project. To contribute safely without affecting the main repository, he must fork an existing repository.

This lab demonstrates how to navigate a Git web UI, fork a repository, and set up proper remotes — essential skills for DevOps engineers working in collaborative, team-based environments.

## Lab Environment & Credentials
•	Platform: KodeKloud Lab

•	Gitea access: Click the Gitea UI button in the lab top bar

•	Login Credentials:

o	Username: jon

o	Password: Jon_pass123

**Business Value: Forking ensures that new contributors can work independently, preserving the integrity of the main project while allowing collaborative development.**

## Step-by-Step Implementation
1️. Open Gitea UI

•	Click the Gitea UI button at the top of the lab page.

•	Screenshot suggestion: Gitea UI button highlighted

•	PNG label: day23_01_gitea_ui.png

2️. Log in as Jon

•	Username: jon

•	Password: Jon_pass123

•	Confirm successful login by viewing the Jon dashboard/avatar.

•	Screenshot suggestion: Successful login page

•	PNG label: day23_02_login_success.png

**Business Benefit: Ensures proper user access control and authentication.**

3. Locate the repository

•	Go to Explore → Repositories

•	Search for sarah/story-blog

•	Click to open the repository page.

•	Screenshot suggestion: Repository search result

•	PNG label: day23_03_repo_search.png

**Business Value: Quick navigation and repository discovery improves team productivity.**

4️. Fork the repository

•	Click the Fork button (usually top-right).

•	In the dialog, select jon as the destination/owner.

•	Confirm the fork.

•	Screenshot suggestion: Fork dialog + new forked repository page

•	PNG labels:

o	day23_04_fork_button.png

o	day23_05_fork_dialog.png

o	day23_06_forked_repo.png

**Business Benefit: Forking enables isolated development, preventing accidental changes to the main repo.**

5️. Verify the fork

•	The forked repository should now be under jon/story-blog.

•	Confirm the repository URL and contents.

•	Screenshot suggestion: Forked repo homepage showing Jon as owner

•	PNG label: day23_07_verify_fork.png

6️. Optional CLI Verification
1.	Clone your fork:

git clone http://<gitea-host>/jon/story-blog.git

cd story-blog

•	Screenshot: Terminal showing successful clone

•	PNG label: day23_08_clone.png

2.	Check remotes:

git remote -v

•	Should show origin pointing to jon/story-blog

3.	Add upstream remote (original repo):

git remote add upstream http://<gitea-host>/sarah/story-blog.git

git fetch upstream

git branch -a

•	Confirms ability to pull updates from the original repository.

•	Screenshot: Remotes and branches list

•	PNG label: day23_09_remotes.png

4.	Create test branch and push:

git checkout -b jon/onboarding

echo "# Onboarding Test" > README-jon.md

git add README-jon.md

git commit -m "Add onboarding test file"

git push -u origin jon/onboarding

•	Verify the branch appears in Gitea → Branches

•	Screenshot: Branch list showing jon/onboarding

•	PNG label: day23_10_branch.png

**Business Benefit: Demonstrates proper Git workflow: fork → clone → branch → push → PR. Critical for team collaboration and DevOps pipelines.**

## Key Learnings
• Navigated Gitea UI and performed repository forking.

•	Set up origin and upstream remotes.

•	Practiced safe contribution workflows to avoid impacting main code.

•	Learned verification techniques via CLI.

## Business & DevOps Relevance
•	Business Needs: Enables new team members to contribute safely without disrupting production code.

•	DevOps Impact:

1. Supports collaborative development.

2. Ensures traceable, auditable code changes.

3. Prepares developers for CI/CD pipelines and code reviews.

Suggested Screenshots for GitHub & LinkedIn
Step	PNG Label
Open Gitea UI	day23_01_gitea_ui.png
Login success	day23_02_login_success.png
Repository search	day23_03_repo_search.png
Fork button	day23_04_fork_button.png
Fork dialog	day23_05_fork_dialog.png
Forked repo homepage	day23_06_forked_repo.png
Verification of fork	day23_07_verify_fork.png
Clone via CLI	day23_08_clone.png
Check remotes	day23_09_remotes.png
Branch push verification	day23_10_branch.png
