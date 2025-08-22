## Project Story
On Day 10, I explored how organizations use Kubernetes Jobs to automate repeatable tasks. Unlike Deployments, which keep applications running indefinitely, Jobs run to completion — making them perfect for tasks like database migrations, backups, or scheduled scripts.
For this exercise, I created a simple job called countdown-devops using a Debian container that sleeps for 5 seconds, simulating a lightweight batch task. This is a foundational skill for larger real-world use cases (data pipelines, CI/CD hooks, ETL processing).
________________________________________
🏢 Business Need & Essence
In business environments, Kubernetes Jobs solve a critical need:
•	Automation: Run batch workloads without human intervention.
•	Reliability: Ensure tasks complete successfully, even if pods fail.
•	Scalability: Multiple jobs can be scheduled across a cluster.
•	Consistency: Same command runs identically every time, across environments.
For teams, this means lower operational risk, repeatability, and efficient cloud resource usage.
________________________________________
⚙️ Steps to Implement
1. Define the Job YAML
apiVersion: batch/v1
kind: Job
metadata:
  name: countdown-devops
spec:
  template:
    metadata:
      name: countdown-devops
    spec:
      containers:
      - name: container-countdown-devops
        image: debian:latest
        command: ["sleep", "5"]
      restartPolicy: Never
2. Apply the Job
kubectl apply -f countdown-job.yaml
3. Verify the Job
kubectl get jobs
kubectl describe job countdown-devops
4. Verify Pods
kubectl get pods
Sample output:
NAME                     READY   STATUS      RESTARTS   AGE
countdown-devops-4wlmn   0/1     Completed   0          86s
5. Check Logs
kubectl logs countdown-devops-4wlmn
Since the command is just sleep 5, there is no output in the logs. This is expected and confirms the pod executed successfully.
________________________________________
📸 Key Screenshots
•	jump_host-login.png → Proof of connecting to Kubernetes environment
•	job-yaml.png → Job manifest definition
•	kubectl-apply-job.png → Job creation success
•	kubectl-get-jobs.png → Job running/completed
•	kubectl-describe-job.png → Job details (command, container, completions)
•	kubectl-get-pods.png → Pod created by the job (countdown-devops-4wlmn)
•	kubectl-logs.png → Log output (empty, since job ran sleep 5)
________________________________________
🌟 Takeaway & Learning Impact
•	Learned how to create one-off workloads in Kubernetes.
•	Understood the difference between Deployments and Jobs.
•	Saw how Jobs map to business processes like reporting, scheduling, and migrations.
This hands-on exercise reinforced how DevOps engineers use Kubernetes to handle not just services, but also batch workloads that power modern enterprises.
________________________________________
🔗 Next Steps in Journey
Following the 100 Days of DevOps, I’ll continue exploring:
•	CronJobs (for scheduled workloads)
•	Advanced job patterns (parallel jobs, completions, backoff limits)
•	Integration with CI/CD pipelines
