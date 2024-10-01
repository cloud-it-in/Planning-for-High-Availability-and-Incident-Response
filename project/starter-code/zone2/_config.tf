terraform {
   backend "s3" {
     bucket = "udacity-tf-dalvipk-west1"
     key    = "terraform/terraform.tfstate"
     region = "us-west-1"
   }
 }

 provider "aws" {
   region = "us-west-1"
   #profile = ""
   
   default_tags {
     tags = local.tags
   }
 }
 provider "aws" {
  alias  = "use2"
  region = "us-east-2"
}
