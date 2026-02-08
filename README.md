# infra-ansible-jenkins-demo-
Generate 3 AWS EC2 servers using Terraform, Ansible to install Nginx and deploy a Web Page, all automated by a Jenkins pipeline.

#Demo project: Terraform + Ansible + Jenkins.
This project creates 3 AWS servers with Terraform, which get configured by Ansible (Nginx Install and Deploys a welcome web page), everything is orchestrated by a Jenkins pipeline.

##Technologies:
- Terraform (Infrastructure as Code)
- Ansible (Automatic configuration)
- Jenkins (pipeline CI/CD)
- AWS (Cloud infrastructure)

##How to use:
1. Clone repository.
2. Configure AWS Credentials ('aws configure').
3. Execute pipeline in Jenkins.
4. Verify that Nginx is running in the generated IP's.

<img width="724" height="2124" alt="image" src="https://github.com/user-attachments/assets/2f5d8e7a-6576-4d39-b5c8-121a806d249d" />


## Project arquitecture

Complete flow:

+------------------+
|     Developer    |
+------------------+
         |
         v
+------------------+
|   Jenkins CI/CD  |
+------------------+
         |
         v
+-----------------------------+
| Stage 1: Terraform          |
| - Initialize AWS provider   |
| - Create 3 EC2 instances    |
| - Export public IPs         |
+-----------------------------+
         |
         v
+-----------------------------+
| Stage 2: Ansible Inventory  |![Uploading image.png…]()

| - Get IPs from outputs      |
| - Generate inventory.ini    |
+-----------------------------+
         |
         v
+-----------------------------+
| Stage 3: Ansible Playbook   |
| - Install Nginx             |
| - Copy index.html           |
| - Configure servers         |
+-----------------------------+
         |
         v
+------------------+
|    Servers EC2   |
|   (Nginx active) |
+------------------+
