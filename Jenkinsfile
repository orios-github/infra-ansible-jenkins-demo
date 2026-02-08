pipeline {
  agent any
  stages {
    stage('Terraform Init & Apply') {
      steps {
        sh 'cd infra && terraform init && terraform apply -auto-approve'
      }
    }
    stage ('Generate Ansible Inventory'){
        steps {
            script {
                //Get IPs from Terraform
                def ips = sh(script: "cd infra && terraform output -json web_ips", returnStdout: true).trim()
                def parsedIps = readJson text: ips

                //Create inventory.ini file dinamically
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
        sh 'ansible-playbook -i ansible/inventory.ini ansible/playbook.yml'
      }
    }
  }
}

