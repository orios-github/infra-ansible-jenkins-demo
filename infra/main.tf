provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  count = var.server_count
  ami = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04 (example)
  instance_type = var.instance_type


  tags = {
    Name = "web-${count.index}"
  }
}

output "web_ips" {
  value = aws_instance.web[*].public_ip
}
