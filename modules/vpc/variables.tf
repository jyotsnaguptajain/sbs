variable "cidr_block" {
  description = "CIDR range for the VPC"
  default     = "10.1.0.0/16"
}

variable "vpc_name" {
  description = "VPC Name"
  default     = "sbs_main"
}