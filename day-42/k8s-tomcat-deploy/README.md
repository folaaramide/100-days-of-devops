# Day 42 - Deploying Tomcat on Kubernetes with NodePort

As part of my 100 Days of DevOps journey on KodeKloud, Day 42 focused on deploying a Java-based Tomcat application on Kubernetes.

This exercise builds on my earlier Docker and Kubernetes networking tasks. It simulates a real-world business scenario where organisations need to deploy scalable Java applications, expose them to internal/external consumers, and integrate seamlessly into existing infrastructure.

## Business Need

Modern enterprises often:

Rely on Java applications (Tomcat) for business-critical services.

Need repeatable, declarative deployments for easier scaling and recovery.

Require predictable access to services via fixed NodePorts for testing, monitoring, or integration.

By deploying Tomcat in Kubernetes with a Deployment and a NodePort Service, we enable:

-Scalability and resilience (replicas & rollout control)

-Declarative infrastructure (YAML manifests stored in Git)

-Predictable access at NodePort 32227

## Steps Performed
**1. Created Namespace**

Namespaces isolate workloads and make environments cleaner.

kubectl create namespace tomcat-namespace-datacenter

kubectl get ns | grep tomcat-namespace-datacenter

**2. Created Deployment**

Defined Tomcat deployment with 1 replica, container port 8080, and image gcr.io/kodekloud/centos-ssh-enabled:tomcat.

tomcat-deployment.yaml

kubectl apply -f tomcat-deployment.yaml

kubectl -n tomcat-namespace-datacenter get deployments

kubectl -n tomcat-namespace-datacenter get pods -o wide

**3. Created Service (NodePort 32227)**

Exposed the Tomcat app via a Service of type NodePort.

tomcat-service.yaml

kubectl apply -f tomcat-service.yaml

kubectl -n tomcat-namespace-datacenter get svc tomcat-service-datacenter -o wide

kubectl -n tomcat-namespace-datacenter describe svc tomcat-service-datacenter

**4. Verified Rollout and Endpoints**

kubectl -n tomcat-namespace-datacenter rollout status deployment/tomcat-deployment-datacenter --timeout=120s

kubectl -n tomcat-namespace-datacenter get pods -o wide

kubectl -n tomcat-namespace-datacenter get endpoints tomcat-service-datacenter

**5. Tested Application Access**
Launched Tomcat App on Lab UI

## Outcome

-Deployed a Tomcat application in Kubernetes with a Deployment + NodePort Service.

-Ensured business requirements of predictable access and containerized app integration were met.

-Demonstrated how Kubernetes enables scalable, resilient, and declarative deployments for enterprise Java applications.
