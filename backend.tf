terraform {
  backend "s3" {
    bucket         = "terraform-state-sbs"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "sbs-terraform-state-lock"
  }
}