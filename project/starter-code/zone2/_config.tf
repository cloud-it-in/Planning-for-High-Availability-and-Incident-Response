terraform {
   backend "s3" {
     bucket = "udacity-zone2-p2"
     key    = "terraform/terraform.tfstate"
     region = "us-west-1"
   }
 }
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "udacity-zone2-p2"
    key    = "vpc/terraform.tfstate"
    region = "us-west-1"
  }
}

 provider "aws" {
   region = "us-west-1"
   
   default_tags {
     tags = local.tags
   }
 }