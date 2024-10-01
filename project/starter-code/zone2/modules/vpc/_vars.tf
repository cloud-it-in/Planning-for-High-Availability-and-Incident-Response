variable "name" {}
 variable "cidr_block" {}

 variable "azs" {
   type = list(string)
 }

 variable "public_subnet_tags" {
   default = {"us-west-1a", "us-west-1b"}
 }

 variable "private_subnet_tags" {
   default = {"us-west-1a", "us-west-1b"}
 }

 variable "account_owner" {
   default = ""
 }