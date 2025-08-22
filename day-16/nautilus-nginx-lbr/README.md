# Day 16 - Configuring an Nginx Load Balancer for High Availability
As part of my 100 Days of DevOps/Cloud journey, today I worked on a high availability challenge inspired by real production scenarios.

##The task 

The Nautilus production support team noticed increasing traffic on one of their business-critical websites, leading to degraded performance. To ensure scalability, resilience, and better customer experience, we completed the final step of migrating the application onto a high availability stack by configuring the Load Balancer (LBR) server using Nginx.

## Business Context
In any growing digital business, website downtime or slowness directly impacts revenue, brand trust, and customer satisfaction. High availability isn’t just a technical buzzword, it’s a business necessity.

By implementing a load balancer, we:

•	Ensure traffic is evenly distributed across multiple servers.

•	Avoid performance bottlenecks on a single machine.

•	Provide fault tolerance — if one server fails, traffic automatically flows to healthy ones.

•	Create a foundation for future scaling as traffic grows.

This project mirrors what happens in real enterprise systems, where an effective load balancer often becomes the difference between smooth customer journeys and outages under load.

## My Implementation
1.	Validated App Servers
-Each App Server (stapp01, stapp02, stapp03) was running Apache (httpd).

-Confirmed Apache was listening on port 3004.

-Verified services were active and serving the application content.
📸 Screenshot suggestion:
o	systemctl status httpd showing Apache running.
o	ss -tulnp | grep 3004 to show Apache listening on 3004.

2.	Installed and Configured Nginx on the LBR Server
-Installed Nginx on the designated Load Balancer server (stlb01).

-Edited /etc/nginx/nginx.conf to replace the default config with a clean reverse proxy setup pointing to all App Servers.

Key snippet:
upstream app_servers {
    server stapp01:3004;
    server stapp02:3004;
    server stapp03:3004;
}

server {
    listen 80;

    location / {
        proxy_pass http://app_servers;
    }
}
📸 Screenshot suggestion:
o	nginx -t showing syntax OK.
o	systemctl status nginx showing the service active and running.

3.	Validated Load Balancer Functionality
-Ran curl http://localhost from the LBR server.

-Successfully received application content:

-Welcome to xFusionCorp Industries!

-Verified that all responses came through the load balancer at port 80, proxying to the App Servers at port 3004.
📸 Screenshot suggestion:
o	Output of curl http://localhost showing the application served.
o	Browser snapshot (via KodeKloud StaticApp button) showing the site loading through the LBR URL.

## Key Learnings
•	Learned how to configure Nginx as a reverse proxy and load balancer in production-like settings.

•	Saw how backend servers can run on non-standard ports (3004 here) while the load balancer presents a standard frontend port (80) for users.

•	Reinforced the principle that high availability = better user experience + business continuity.

## Recruiter-Friendly Takeaway
Today I implemented a real-world high availability setup by configuring an Nginx load balancer to proxy and balance traffic across multiple Apache servers. This project showcased my ability to:

•	Understand and deliver business-critical infrastructure improvements.

•	Apply Linux server management, Nginx configuration, and load balancing concepts in practice.

•	Contribute to scalable and resilient system design — a must-have skill for modern cloud and DevOps engineers.

📸 Suggested Screenshot Labels
For clarity in GitHub and LinkedIn:
1.	apache_status_app_server.png – Apache service running on App Server.
2.	apache_port_check.png – Apache listening on port 3004.
3.	nginx_config_test.png – Nginx config syntax OK.
4.	nginx_status.png – Nginx active and running.
5.	curl_test_loadbalancer.png – Application content served from LBR.
6.	browser_staticapp_test.png – Application accessible via LBR URL in browser.

**With this, the application is now highly available through a properly configured load balancer, ensuring performance and reliability as traffic grows.**
