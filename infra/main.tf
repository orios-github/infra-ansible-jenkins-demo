#Configure provider and region.
provider "aws" {
  region = var.region
}

#Resource that creates EC2 instances.
resource "aws_instance" "web" {
  count = var.server_count    #Servers amount
  ami = var.ami_id    #Image (SO)    
  instance_type = var.instance_type    #Instance type

  #Tags for each server.
  tags = {
    Name = "web-${count.index}"   #web-0, web-1, web-2
  }
}


output "web_ips" {
  value = aws_instance.web[*].public_ip
}
