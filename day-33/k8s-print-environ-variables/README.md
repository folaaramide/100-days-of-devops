# Day 33: Kubernetes Environment Variables in Pods
Today’s challenge on my 100 Days of DevOps (KodeKloud Labs) was about configuring and testing environment variables in a Kubernetes Pod.

This may look simple at first glance, but in a real-world enterprise setting, applications often depend on runtime configurations (such as database credentials, API endpoints, or feature flags). Kubernetes environment variables provide a secure, flexible, and consistent way to inject such values into containers.

## Business Need & Essence of the Project
The Nautilus DevOps team wanted to validate how their application could dynamically generate greetings for different users and groups. This type of setup simulates config-driven applications, where you don’t hardcode values into code but inject them at runtime.

The main business benefits include:
-Separation of code from configuration: making applications portable across environments (dev, test, prod).

-Flexibility: teams can quickly change runtime behavior without rebuilding images.

-Security & compliance: sensitive values (like credentials) can be managed via env vars or Kubernetes Secrets.

-Resilience: avoids hardcoding values, reducing errors during deployments.

## Step-by-Step Implementation

Step 1: Verify Permissions

kubectl auth can-i create pods --namespace=default

Ensures we have the right privileges to create pods in the cluster.
📸 Screenshot: 01-auth-check.png

Step 2: Create Pod Manifest

I created a file called print-envars-greeting.yaml:
apiVersion: v1
kind: Pod
metadata:
  name: print-envars-greeting
spec:
  restartPolicy: Never
  containers:
  - name: print-env-container
    image: bash
    command: ["/bin/sh", "-c", 'echo "$(GREETING) $(COMPANY) $(GROUP)"']
    env:
    - name: GREETING
      value: "Welcome to"
    - name: COMPANY
      value: "DevOps"
    - name: GROUP
      value: "Industries"
📸 Screenshot while editing manifest in terminal: 02-create-manifest.png

Step 3: Apply the Pod

kubectl apply -f print-envars-greeting.yaml
📸 Screenshot showing success message: 03-apply-pod.png

Step 4: Verify Pod Status

kubectl get pods -o wide

The pod should reach Completed/Succeeded since the command exits after printing.
📸 Screenshot: 04-pod-status.png

Step 5: View Logs

kubectl logs -f print-envars-greeting

Output:

Welcome to DevOps Industries

📸 Screenshot showing logs output: 05-logs-output.png

Step 6: Describe Pod (for Validation)

kubectl describe pod print-envars-greeting

This confirms:

-Correct environment variables are set

-Restart policy = Never

-Exit code = 0
📸 Screenshot: 06-describe-pod.png

## Key Learnings & Benefits
1. Learned how Kubernetes Pods can be configured with runtime environment variables, crucial for modern microservices.
2. Reinforced the importance of restart policies (Never ensures batch jobs exit cleanly without loops).
3. Validated logs to confirm that Kubernetes injected values into the container as expected.
4. This mirrors how production systems inject API keys, feature flags, or tenant-specific configs into containers.

📂 Project Files
•	print-envars-greeting.yaml
### This marks Day 33 of my journey, building stronger Kubernetes foundations one step at a time!
