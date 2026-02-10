# Infra-ansible-jenkins-demo
Generate desired number of AWS EC2 servers using Terraform, Ansible to install Nginx and deploy a Web Page, all automated by a Jenkins pipeline.

#Demo project: Terraform + Ansible + Jenkins.
This project creates any number of AWS EC2 instances with Terraform, which get configured by Ansible (Nginx Install and Deploys a welcome web page), everything is orchestrated by a Jenkins pipeline.

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

## Project architecture
<img width="482" height="1182" alt="image" src="https://github.com/user-attachments/assets/ec6cbfa9-71e7-4e3a-bf2b-fdaa0724515a" />



