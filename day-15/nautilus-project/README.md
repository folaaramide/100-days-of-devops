# Day 10 of 100 Days of DevOps: Secure Nginx Deployment
Continuing my 100 Days of DevOps journey, today I worked on a real-world server preparation task, setting up a secure Nginx server with SSL on App Server 3 in Stratos Datacenter.

## Project Overview
The xFusionCorp Industries SysAdmin team required a production server to be made ready for application deployment. The key requirements included:

•	Installing & configuring Nginx.

•	Deploying a self-signed SSL certificate.

•	Creating a default index.html file.

•	Testing access securely from another server.

## Steps & Essence
1.	Installed Nginx on App Server 3

-Command: sudo yum install nginx -y

Essence: Web servers form the backbone of web applications. Getting Nginx running is the foundation.

2.	Moved SSL certificates to secure location

-Location: /etc/nginx/ssl/

Essence: SSL certificates enforce encrypted communication, critical for business trust and compliance.

3.	Configured Nginx for HTTPS

-Config file: /etc/nginx/conf.d/nautilus.conf

Essence: Ensures the application will be accessible securely, aligning with modern security best practices.

4.	Created index.html with “Welcome!”

-Location: /usr/share/nginx/html/

-Essence: Provides a visible validation of deployment success for users and stakeholders.

5. Tested from Jump Host using curl

-Command: curl -Ik https://<app-server-3-ip>/

-Essence: Final confirmation of end-to-end connectivity and secure readiness for deployment.

## Key Learnings & Business Impact
1. Learned how to deploy and secure web servers.
2. Understood the importance of SSL for data security & compliance.
3. Gained experience in end-to-end testing of server readiness.
4. Recruiter takeaway: This demonstrates my ability to handle real-world server provisioning tasks that are essential in DevOps and cloud environments.
