import groovy.json.JsonSlurper
import groovy.json.JsonSlurper




pipeline {
  agent any
  environment { 
    AWS_ACCESS_KEY_ID = credentials('aws-access-key-id') 
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
  }
  stages {
    stage('Checkout') { 
      steps { 
        git branch: 'main', url: 'https://github.com/orios-github/infra-ansible-jenkins-demo.git' 
      } 
    }
    stage('Terraform Init & Apply') {
      steps {
        // Initialize Terraform and create infrastructure in AWS.
        sh 'cd infra && terraform init && terraform apply -auto-approve'
      }
    }
    stage ('Generate Ansible Inventory'){
        steps {
            script {
              //Get IPs from Terraform in JSON format.
              def tfOutput = sh(script: 'cd infra && terraform output -json web_ips', returnStdout: true).trim() 
              def parsed = new JsonSlurper().parseText(tfOutput)
              //Create inventory.ini file dinamically.
              def ips = parsed.value
              def inventory = "[web]\n" + ips.join("\n") + "\n" 
              writeFile file: 'ansible/inventory.ini', text: inventory
              echo "Generated inventory:\n${inventory}"
            }
        }
    }
    stage ('Configure with Ansible') {
      steps {
        //Executes Ansible playbook to configure the servers.
        sh 'ansible-playbook -i ansible/inventory.ini ansible/playbook.yml'
      }
    }
  }
}

