#Define AWS region to deploy servers.
variable "region" {
  default = "us-east-1"
}

#Define EC2 instance type.
variable "instance_type" {
  default = "t3.micro"
}

#Number of servers to create.
variable "server_count" {
  default = 3
}

#Define AMI (SO Image).
variable "ami_id" {
  #Ubuntu 24.04 LTS
  default = "ami-0786adace1541ca80" 
}
