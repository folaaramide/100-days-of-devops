# Day 26 of 100 Days of DevOps - Managing Git Remotes & Pushing Updates
## Context in My DevOps Journey
As part of my 100 Days of DevOps challenge, I’ve been focusing on mastering real-world workflows that DevOps engineers handle daily. Today’s task took me deeper into Git repository management within a simulated enterprise environment on KodeKloud.

The xFusionCorp DevOps team required updates to their Git setup due to changes in their infrastructure. A new remote repository was introduced (/opt/xfusioncorp_media.git) alongside an existing one (/opt/media.git). My task was to:

1.	Add a new remote called dev_media.
2.	Commit a business-critical file (index.html) into the repo.
3.	Push the updated master branch to the new remote.
This exercise reflects real-life DevOps workflows where teams maintain multiple Git remotes, ensuring updates propagate to the right codebases while supporting migration or redundancy scenarios.

## Business Needs & Benefits
•	Business Need:

As xFusionCorp migrated and reorganized their Git infrastructure, ensuring code synchronization between old and new remotes was crucial. Missing updates could break builds or delay deployments.

•	Benefits of This Task:
-Guarantees consistent code availability across repositories.

-Builds redundancy into source control strategy.

-Strengthens confidence in Git fundamentals (remotes, commits, pushes).

-Simulates multi-team collaboration where developers push changes to multiple remotes.

## Step-by-Step Implementation
1. Logged into stoarge server & Environment

-I was logged in as the correct user (natasha) on the Storage server.
ssh natasha@ststor01

2. Inspect Required Directories & Files

Verified existence of working repo, new remote repo, and the file to be committed.

ls -ld /usr/src/kodekloudrepos/media /opt/xfusioncorp_media.git /tmp/index.html

-Confirmed media repo, new bare repo, and index.html.

3. Configure Git Safe Directory

Resolved ownership warnings by marking the repo as safe.

git config --global --add safe.directory /usr/src/kodekloudrepos/media

4. Navigate & Check Repo Status

Switched to the repo and checked the current branch and remotes.

cd /usr/src/kodekloudrepos/media

sudo git status

sudo git remote -v

sudo git branch -a

sudo git checkout master 2>/dev/null || true

-Repo was clean, on master, synced with origin.

5. Add New Remote dev_media

Added the new bare repo as a remote.

sudo git remote add dev_media /opt/xfusioncorp_media.git

sudo git remote -v

-Now had both origin and dev_media.

6. Add the Business Change (index.html)

Copied required file into repo, staged and committed.

sudo cp -f /tmp/index.html .

ls -l index.html

sudo git add index.html

sudo git commit -m "Add index.html from /tmp as part of xFusionCorp media update"

-Commit successful (f1952aa).

7. Push Updates to New Remote

Pushed master branch to dev_media.

sudo git push -u dev_media master

-Branch set to track dev_media/master.

8. Verify Remote State

Confirmed new commit exists on the new remote repo.

sudo git ls-remote --heads dev_media

git --git-dir=/opt/xfusioncorp_media.git log --oneline -n 3

git --git-dir=/opt/xfusioncorp_media.git ls-tree --name-only HEAD

-Verified commit and file (index.html) exist in remote.

## Key Takeaways
•	Learned how to manage multiple Git remotes effectively.

•	Practiced safe branching, committing, and pushing strategies.

•	Understood the business criticality of code propagation in migrations.

•	Strengthened real-world DevOps skills in handling Git server changes.

**This exercise reinforced how critical version control and remote sync are in real enterprise DevOps. Small updates like a single index.html file can represent production fixes that must never be missed.**
