# Day 11 – Deploying Java Web Application on Tomcat

**Part of my [100 Days of DevOps] challenge**

## Context
For Day 11, I simulated a real-world Java application deployment scenario. The Nautilus DevOps team had completed the beta version of a Java web application and decided to host it on Tomcat for internal testing.

## Objective
- Install Tomcat on App Server 1
![Screenshot](screenshots/install-tomcat.png)

- Configure Tomcat to run on a custom port (3001)

- Deploy `ROOT.war` so the app runs directly on the base URL

- Verify deployment from the jump host

## Tools & Environment

- **Tomcat 9** (application server)

- **Java WAR** deployment

- **Linux server management**

- **SSH & SCP** for file transfer

## Step-by-Step Solution

1. **SSH into App Server 1**

ssh tony@stapp01

Install Tomcat

sudo yum install -y tomcat tomcat-webapps tomcat-admin-webapps

2. **Change Tomcat Port**

sudo vi /etc/tomcat/server.xml

Changed 8080 → 3001.

3. **Start and Enable Tomcat**

sudo systemctl start tomcat

sudo systemctl enable tomcat

4. **Deploy ROOT.war**

scp /tmp/ROOT.war tony@stapp01:/tmp

sudo mv /tmp/ROOT.war /var/lib/tomcat/webapps/

5. **Restart Tomcat**

sudo systemctl restart tomcat

Test Application

curl http://stapp01:3001

## Outcome
Successfully deployed a Java WAR file to Tomcat.

Configured custom port without breaking service.

Verified application runs from the base URL with no additional path.

## Key Takeaways
Tomcat configuration flexibility enables quick adaptation for different environments.

WAR deployment to the ROOT context simplifies application access for users.

Command-line deployment skills are crucial for DevOps engineers in hybrid environments.
