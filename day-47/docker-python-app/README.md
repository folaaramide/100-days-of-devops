# Day 47: Dockerize & Deploy Python App on App Server 3

## Project Summary:
On Day 47 of my #100DaysOfDevOps journey, I containerised a Python application and deployed it on App Server 3. The task involved creating a Dockerfile, building a Docker image, running the container with proper port mapping, and testing the app with curl.

## Business Need:
Containerising applications ensures consistent deployment across environments, reduces dependency issues, and accelerates delivery — critical for xFusionCorp Industries’ DevOps pipeline. This task mimics real-world requirements where apps must run reliably on production servers.

## Step-by-Step Task & Commands:

**1. Verify app files and dependencies:**

sudo ls -la /python_app

sudo ls -la /python_app/src

sudo test -f /python_app/src/requirements.txt && echo "requirements.txt found"

sudo test -f /python_app/src/server.py && echo "server.py found"

sudo docker --version

**2. Create Dockerfile under /python_app:**
```
sudo tee /python_app/Dockerfile > /dev/null <<'EOF'
FROM python:3.10-slim
WORKDIR /app
COPY src/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY src/ .
EXPOSE 6100
CMD ["python3", "server.py"]
EOF
sudo cat /python_app/Dockerfile
```

**3. Build Docker image nautilus/python-app:**

cd /python_app

sudo docker build -t nautilus/python-app .

sudo docker images | grep nautilus

**4. Run container pythonapp_nautilus (host 8091 → container 6100):**

sudo docker rm -f pythonapp_nautilus 2>/dev/null || true

sudo docker run -d --name pythonapp_nautilus -p 8091:6100 nautilus/python-app

sudo docker ps -a --filter "name=pythonapp_nautilus"

**5. Test the application with curl:**

curl -sS http://localhost:8091/

**Expected output:**

Welcome to xFusionCorp Industries!

## Business Value of Task:
-Ensures consistent runtime for Python apps across servers.

-Supports scalable and repeatable deployments in production environments.

-Demonstrates end-to-end DevOps flow: from code to containerized deployment.
