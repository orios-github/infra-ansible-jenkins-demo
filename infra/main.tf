provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  count = var.server_count
  ami = var.ami_id 
  instance_type = var.instance_type


  tags = {
    Name = "web-${count.index}"
  }
}

output "web_ips" {
  value = aws_instance.web[*].public_ip
}
