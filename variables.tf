variable "aws_region" {
  type    = string
  default = "ap-southeast-2"
}
variable "ami_id" {
  default = "ami-0361bbf2b99f46c1d"
}
variable "instance_type" {
  default = "t2.micro"
}