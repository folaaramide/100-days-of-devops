# 100 Days of DevOps - Day 34: Automating Release Tagging with Git Hooks

## Project Overview
On Day 34 of my 100 Days of DevOps journey, I worked on automating release tagging in a Git repository using server-side hooks. The task involved:

-Setting up a post-update hook in a bare Git repository on a storage server.

-Ensuring that every time the master branch is updated, a release tag is automatically created using the current date.

-Merging a feature branch into master and validating the automation.

This exercise simulates a real-world DevOps workflow where teams need automated versioning and release management, crucial for continuous delivery pipelines and ensuring traceability of deployments.

## Business Value
•	Automated Release Management: Reduces manual errors in tagging releases and ensures that each master update is properly versioned.

•	Traceability: Tags correspond to actual release dates, helping operations and QA teams track production-ready changes.

•	CI/CD Ready: Tagged releases can be directly used in pipelines for deployment or rollback purposes.

•	Team Collaboration: Helps multiple developers maintain consistent versioning in a shared repository.

## Project Steps & Explanation
1. Access the Storage Server

ssh natasha@ststor01

Purpose: Connect to the server hosting the bare Git repository to create server-side hooks.

2. Navigate to the Bare Repository Hooks Directory

cd /opt/cluster.git/hooks

Purpose: Git hooks reside in the hooks/ folder of the bare repository.

3. Create the Post-Update Hook

The post-update hook automatically tags master after any push:

sudo tee /opt/cluster.git/hooks/post-update > /dev/null << 'EOF'

#!/bin/sh

# post-update hook for /opt/cluster.git

# Creates a release tag for master branch whenever master is updated

DATE=$(date +%F)

CHANGED_MASTER=0

for ref in "$@"

do

    if echo "$ref" | grep -q "refs/heads/master"; then
    
        CHANGED_MASTER=1
        
        break
    
    fi

done

if [ $CHANGED_MASTER -eq 1 ] || [ -z "$@" ]; then

    echo "Creating release tag for $DATE..."
    
    if ! git rev-parse "release-$DATE" >/dev/null 2>&1; then
    
        git tag -a "release-$DATE" -m "Release for $DATE"
        
        echo "Tag release-$DATE created."
    
    else
    
        echo "Tag release-$DATE already exists."
    
    fi

fi

EOF

Purpose:

-Detects updates to master (refs/heads/master)
-Creates a release tag using today's date if it doesn’t exist

Screenshot Suggestion: post_update_hook.png
Label: “Post-update hook script created”

4. Make the Hook Executable

sudo chmod +x /opt/cluster.git/hooks/post-update

sudo ls -l /opt/cluster.git/hooks/post-update

Purpose: Ensure Git can execute the hook on server-side pushes.
Screenshot Suggestion: hook_permissions.png
Label: “Hook made executable with correct permissions”

5. Merge Feature Branch into Master

cd /usr/src/kodekloudrepos/cluster

sudo git checkout master

sudo git pull origin master

sudo git merge --no-ff feature -m "Merge feature into master"

Purpose: Ensure the master branch is updated so the hook can be triggered.

Screenshot Suggestion: merge_feature_master.png
Label: “Feature branch merged into master”

6. Push Master to Trigger Hook

sudo git push origin master

Outcome:

remote: Creating release tag for 2025-09-09...

remote: Tag release-2025-09-09 created.

Purpose: Triggers the post-update hook to create the release tag.

Screenshot Suggestion: push_trigger_hook.png
Label: “Push triggers automatic release tagging”

7. Verify Tag Creation

sudo git --git-dir=/opt/cluster.git tag -l

sudo git --git-dir=/opt/cluster.git show release-$(date +%F)

Outcome: The tag exists and points to the latest commit in master.

Screenshot Suggestion: release_tag_verification.png
Label: “Server-side release tag verified”

Project Repository Structure
100-days-of-devops/
└── day-34-git-hooks/
    ├── README.md                  # This README
    ├── cluster-feature.txt        # Example feature added in the merge
    ├── scripts/
    │   └── post-update-hook.sh   # Copy of the server-side hook script
    └── screenshots/
        ├── ssh_login.png
        ├── bare_repo_hooks.png
        ├── post_update_hook.png
        ├── hook_permissions.png
        ├── merge_feature_master.png
        ├── push_trigger_hook.png
        └── release_tag_verification.png
________________________________________
Script for Replay / Automation
#!/bin/bash
## Benefits Highlight

•	Automation: No manual tagging needed, reduces human errors.

•	Business Continuity: Each release can be traced to a commit and date.

•	Team Collaboration: Ensures all developers work with consistent release versions.
•	CI/CD Ready: Tags can trigger downstream deployment pipelines.
________________________________________
