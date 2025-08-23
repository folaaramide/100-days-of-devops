# Day 19 of 100 Days of DevOps- Hosting Multiple Static Websites on Apache
Today’s challenge at xFusionCorp Industries focused on preparing infrastructure for two upcoming products: a News Portal and a Gaming Website.

Although the sites are still in development, the business wanted the servers ready in advance to ensure a smooth transition once the applications are complete.

This project reinforced the importance of infrastructure readiness in DevOps: building scalable, reliable environments ahead of time so development teams can deploy without delay.

## Business Essence
For companies, reducing time-to-market is critical. By provisioning Apache in advance and configuring it to serve multiple static websites on a custom port (6400), we ensured:
-Faster deployment cycles once dev work is done.

-Security & compliance by using a non-standard port.

-Clear separation of environments for each site (news and games).

-Business continuity — operations don’t wait on development.

This highlights the DevOps principle of collaboration between Dev and Ops, where infra is prepared ahead of code readiness.

## Steps I Took

1. Installed Apache Web Server on App Server 3

sudo yum install httpd -y

2. Configured Apache to Listen on Port 6400

sudo sed -i 's/^Listen 80/Listen 6400/' /etc/httpd/conf/httpd.conf

grep Listen /etc/httpd/conf/httpd.conf

3. Prepared Directories for the Sites

sudo mkdir -p /var/www/html/news

sudo mkdir -p /var/www/html/games

4. Transferred Website Backups from Jump Host

Initially, direct scp failed due to permissions on /var/www/html/.

Workaround: copied files into /tmp/ and then moved them with sudo.

From jump_host:

scp -r /home/thor/news/*  banner@stapp03:/tmp/

scp -r /home/thor/games/* banner@stapp03:/tmp/

On App Server 3:

sudo cp -r /tmp/* /var/www/html/news/

sudo cp -r /tmp/* /var/www/html/games/

5. Configured Virtual Hosts

Created a new Apache config file:

sudo vi /etc/httpd/conf.d/sites.conf

Added:

<VirtualHost *:6400>

    Alias /news /var/www/html/news
    
    <Directory /var/www/html/news>
    
        Require all granted
    
    </Directory>

</VirtualHost>

<VirtualHost *:6400>

    Alias /games /var/www/html/games
    
    <Directory /var/www/html/games>
    
        Require all granted
    
    </Directory>

</VirtualHost>

6. Restarted Apache

sudo systemctl restart httpd

sudo systemctl enable httpd

sudo systemctl status httpd

7. Verified Access

curl http://localhost:6400/news/

curl http://localhost:6400/games/

## Key Takeaways
•	Learned how to configure Apache to serve multiple sites on a custom port.
•	Solved a real-world permissions issue by staging files in /tmp/ and moving with sudo.
•	Reinforced the DevOps principle of infra readiness, ensuring operations and dev teams can work in parallel.
