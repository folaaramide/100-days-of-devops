# Day 1 - Kubernetes: Create a Pod

As part of my #100DaysOfDevOps challenge, I worked with Kubernetes to create a basic Pod using the `kubectl` CLI tool.

## 📌 Task Details

The goal was to create a Kubernetes Pod that runs the `nginx` web server. This involved:

- Creating a Pod named **`pod-nginx`**
- Using the Docker image **`nginx:latest`**
- Naming the container **`nginx-container`**
- Adding a label: `app=nginx_app`

## 🚀 Commands Used

Create the pod: 
kubectl apply -f pod.yaml

Check pod status: kubectl get pods

Describe the pod (to verify container name, image, etc.): kubectl describe pod pod-nginx

## ✅ Outcome
Pod successfully created and running

Verified correct image, labels, and container name

📸 Screenshots
Command Output	Description
Pod creation and verification via CLI

## 💡 What I Learned
How to define and apply a basic pod configuration using YAML

The importance of metadata like labels and container naming in Kubernetes

Using kubectl describe and kubectl get to inspect running workloads

## 🔗 Related Tools
Kubernetes

kubectl

Docker (for container image)

🔁 Stay tuned for more as I continue through the 100 Days of DevOps challenge!

## 📄 pod.yaml

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  labels:
    app: nginx_app
spec:
  containers:
    - name: nginx-container
      image: nginx:latest

