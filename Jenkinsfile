pipeline {
  agent any
  environment { 
    AWS_ACCESS_KEY_ID = "${env.aws-access-key_USR}" 
    AWS_SECRET_ACCESS_KEY = "${env.aws-access-key_PSW}" 
  }
  stages {
    stage('Checkout') { 
      steps { 
        git branch: 'main', url: 'https://github.com/orios/infra-ansible-jenkins-demo.git' 
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
                def ips = sh(script: "cd infra && terraform output -json web_ips", returnStdout: true).trim()
                def parsedIps = readJson text: ips

                //Create inventory.ini file dinamically.
                def inventoryContent = "[web]\n"
                for (ip in parsedIps) {
                    inventorycontent += "${ip}\n"
                }
                writeFile file: 'ansible/inventory.ini', text: inventoryContent
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

