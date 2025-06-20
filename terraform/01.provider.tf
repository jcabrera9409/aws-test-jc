/*terraform {
  backend "s3" {
    bucket = "only-class-purpose"
    key = "aws-test-terraform/terraform.tfstate"
    region = "us-east-1"
  }
}*/

provider "aws" {
  region = var.region
}