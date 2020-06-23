variable "credentials_file" { }
variable "region" {
  type = string
  default = "us-east-2"
}
variable "zone" {
  default = "us-east-2a"
}
variable "web_instance_count" {
  type    = number
  default = 1
}



