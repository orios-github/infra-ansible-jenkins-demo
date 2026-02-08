#Configure provider and region.
provider "aws" {
  region = var.region
}

#Resource access to public key
resource "aws_key_pair" "jenkins_key" {
  key_name   = "jenkins-key"
  public_key = file("~/.ssh/id_rsa.pub")   #Public Key
}

#Resource that creates EC2 instances.
resource "aws_instance" "web" {
  count = var.server_count    #Servers amount
  ami = var.ami_id    #Image (SO)    
  instance_type = var.instance_type    #Instance type
  key_name      = aws_key_pair.jenkins_key.key_name

  #Tags for each server.
  tags = {
    Name = "web-${count.index}"   #web-0, web-1, web-2
  }
}


