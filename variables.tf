variable "aws_region" {
  type    = string
  default = "ap-southeast-2"
}
variable "ami_id" {
  type    = string
  default = "ami-0361bbf2b99f46c1d"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "vpc_name" {
  type    = string
  default = "sbs_main"
}