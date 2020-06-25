
# Provider
 provider "aws" {
   access_key = ""
   secret_key = ""
   region = var.region
 }

# Retrieve the AZ where we want to create network resources
data "aws_availability_zones" "available" {
  state = "available"
}
data "aws_vpc" "selected" {
  id = var.aws_vpc
}

# VPC Resource
#resource "aws_vpc" "main" {
 # cidr_block = "10.11.0.0/16"
  #enable_dns_support = true
  #enable_dns_hostnames = true
  #tags = {
   # Name = "Test-VPC"
    #Environment = "Test"
   #}
#}

# AWS subnet resource
resource "aws_subnet" "test" {
 vpc_id = data.aws_vpc.selected.id
 cidr_block = "10.11.1.0/24"

 #data.aws_availability_zones.available.names[0]= will create subnet in 2a [1]-2b [2]-2c
 availability_zone = data.aws_availability_zones.available.names[0]
 map_public_ip_on_launch = "false"
 tags = {
   Name = "Test_subnet1"
 }
}

# AWS instance
#resource "aws_instance" "web" {
  #ami = "ami-3b261642"
  #instance_type = "t1.micro"
  #tags = {
    #Name = "myInstance"
  #}
#}

  # AWS S3 bucket
  #resource "aws_s3_bucket" "tfstatebucket" {
  #bucket = "rl.tfstate"
  #acl    = "private"
  #versioning {
    #enabled = false
  #}

  # We also want to make sure our bucket enables server-side encryption
  #server_side_encryption_configuration {
    #rule {
      #apply_server_side_encryption_by_default {
       # sse_algorithm = "AES256"
      #}
    #}
  #}
  #tags = {
   # Name = "s3bucket"
  #}
#}
