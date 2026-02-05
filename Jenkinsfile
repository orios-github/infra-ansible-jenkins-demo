pipeline {
  agent any
  stages {
    stage('Terraform Init & Apply') {
      steps {
        sh 'cd infra && terraform init && terraform apply -auto-approve'
      }
    }
    stage ('Configure with Ansible') {
      steps {
        sh 'ansible-playbook -i ansible/inventory.ini ansible/playbook.yml'
      }
    }
  }
}

