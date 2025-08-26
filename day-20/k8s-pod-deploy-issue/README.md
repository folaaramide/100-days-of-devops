# Day 20 of 100 Days of DevOps - Kubernetes Pod Troubleshooting
As part of my 100 Days of DevOps challenge on KodeKloud, I tackled a real-world troubleshooting scenario. A junior team member encountered an error deploying a pod on our Kubernetes cluster. The pod failed to start, and my task was to diagnose and resolve the issue so the application could be brought online.

## Business Context
For any business running on Kubernetes:

-A pod in ImagePullBackOff means services are unavailable.

=Unavailability can lead to customer dissatisfaction, SLA breaches, and revenue loss.

-As a DevOps Engineer, ensuring pods run correctly is critical for service reliability and business continuity.

This exercise demonstrates how attention to detail and structured troubleshooting restores reliability quickly.

## Problem Statement
1. Pod name: webserver
2. Primary container: nginx-container (image nginx:latest)
3. Sidecar container: sidecar-container (image ubuntu:latest)
The pod was failing to start with ImagePullBackOff.

## Troubleshooting Workflow
All commands were run on the jump_host, which is configured with kubectl access to the cluster.

1. Check Pod Status

kubectl get pods

![Screenshot](screenshots/pod-list.png)

2️. Describe Pod for Details

kubectl describe pod webserver

Output (excerpt):

Warning  Failed     kubelet  Error: ErrImagePull

Back-off pulling image "nginx:latests"

Failed to pull image "nginx:latests": not found

**Discovery:** The nginx container was pointing to nginx:latests (typo) instead of nginx:latest.
![Screenshot](screenshots/pod-describe.png)
3️. Extract Pod YAML

kubectl get pod webserver -o yaml > webserver.yaml

cat webserver.yaml

Snippet showing the error:

![Screenshot](screenshots/yaml-before.png)
4️. Fix the Typo in YAML

Edited webserver.yaml:

containers:

  - name: nginx-container
  
    **image: nginx:latest**

![Screenshot](screenshots/yaml-fixed.png)

5. Re-deploy Pod

Since a running pod spec cannot be modified directly, I deleted and reapplied:

kubectl delete pod webserver

kubectl apply -f webserver.yaml

![Screenshot](screenshots/apply-fix.png)

6️. Verify Pod is Running

kubectl get pods

kubectl describe pod webserver

Observed: Pod moved to Running state.
![Screenshot](screenshots/pod-running.png)

7️. Validate Application Access

kubectl exec -it webserver -c nginx-container -- curl localhost

Output:![Screenshot](screenshots/nginx-access.png)

## Outcome
1. Root Cause: Typo in container image (nginx:latests instead of nginx:latest).
2. Resolution: Corrected YAML, redeployed, and pod became Running.
3. Validation: Nginx welcome page confirmed container was accessible.

## Key Takeaways
1. Even small typos in manifests can cause big outages.
2. Systematic debugging with kubectl describe and kubectl logs pinpoints root causes.
3. Deleting and recreating pods is sometimes necessary when specs change.
•	This exercise mirrors real-world troubleshooting, where fast resolution ensures uptime, reliability, and customer trust.
