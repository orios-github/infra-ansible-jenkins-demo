provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  count = 3
  ami = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04 (ejemplo)
  instance_type = "t2.micro"


  tags = {
    Name = "web-${count.index}"
  }
}

output "web_ips" {
  value = aws_instance.web[*].public_ip
}
