# Day 51: Persistent Volumes with Nginx

---

As part of my 100 Days of DevOps journey, today I worked on Persistent Volumes (PV) and Persistent Volume Claims (PVC) in Kubernetes.

In real-world businesses, applications must retain data even when pods restart. Kubernetes achieves this by decoupling storage from compute, ensuring reliability, compliance, and continuity. For a web app like Nginx, persistent storage guarantees that application content is not lost across redeployments.

---

## Business Need

---

The Nautilus DevOps team needed a Kubernetes deployment template to run a web server (nginx) while ensuring that its document root is backed by persistent storage.
This solves:

-Pod lifecycle issues → data survives pod restarts.
-Separation of concerns → storage is managed independently of containers.
-Scalability & flexibility → different apps can request storage via PVCs without knowing the backend details.

---

## Steps & Implementation

---

1. Create a PersistentVolume

**pv-datacenter.yaml**

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-datacenter
spec:
  storageClassName: manual
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/security
```

**Commands:**

```
kubectl apply -f pv-datacenter.yaml
kubectl get pv
```

📸 Screenshot → pv-pvc-bound.png (showing Bound later when PVC is attached)

**2️. Create a PersistentVolumeClaim**

**pvc-datacenter.yaml**

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-datacenter
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 2Gi
```

**Command:**

```
kubectl apply -f pvc-datacenter.yaml
kubectl get pvc
```

📸 Screenshot → pvc-bound.png

**3️. Create the Pod with Nginx and Mount PVC**

**pod-datacenter.yaml**

```
apiVersion: v1
kind: Pod
metadata:
  name: pod-datacenter
  labels:
    app: web-datacenter
spec:
  containers:
  - name: container-datacenter
    image: nginx:latest
    volumeMounts:
    - name: datacenter-volume
      mountPath: /usr/share/nginx/html
  volumes:
  - name: datacenter-volume
    persistentVolumeClaim:
      claimName: pvc-datacenter
```

**Command:**
```
kubectl apply -f pod-datacenter.yaml
kubectl get pod pod-datacenter -o wide
```

📸 Screenshot → pod-running.png

**4️. Expose the Pod via NodePort Service**

**svc-datacenter.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: web-datacenter
spec:
  type: NodePort
  selector:
    app: web-datacenter
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30008
```

**Command:**

```
kubectl apply -f svc-datacenter.yaml
kubectl get svc web-datacenter -o wide
```

📸 Screenshot → service-nodeport.png

**5️. Validate Deployment**

**Check pod mount:**

```
kubectl exec -it pod-datacenter -- ls -l /usr/share/nginx/html
```

**6. Verify nginx process:**
```
kubectl exec -it pod-datacenter -- cat /proc/1/cmdline
```

Curl inside pod:
```
kubectl exec -it pod-datacenter -- curl -I http://localhost
```

Curl from NodePort:
```
curl http://<NodeIP>:30008
```

📸 Screenshot →

proc-nginx.png (nginx master process running)

curl-localhost.png (403 Forbidden nginx/1.29.1)

nodeport-curl.png (same 403 via NodePort)

## Outcome

---

The expected response was:

403 Forbidden
nginx/1.29.1

This confirms that:

PVC was successfully mounted into Nginx doc root.

Nginx is serving content (but directory is empty, hence 403).

Service exposure via NodePort works as intended.

---

## Key Benefit
This exercise highlights how Kubernetes enables stateful workloads by abstracting storage. For enterprises, this ensures data persistence, scalability, and reliability, even in highly dynamic containerized environments.
