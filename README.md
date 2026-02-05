# infra-ansible-jenkins-demo-
Generate 3 AWS EC2 servers using Terraform, Ansible to install Nginx and deploy a Web Page, all automated by a Jenkins pipeline.

#Demo project: Terraform + Ansible + Jenkins.
This project creates 3 AWS servers with Terraform, which get configured by Ansible (Nginx Install and Deploys a welcome web page), everything is orchestrated by a Jenkins pipeline.

##Technologies:
- Terraform
- Ansible
- Jenkins
- AWS

##How to use:
1. Clone repository.
2. Configure AWS Credentials ('aws configure').
3. Execute pipeline in Jenkins.
4. Verify that Nginx is running in the generated IP's.
