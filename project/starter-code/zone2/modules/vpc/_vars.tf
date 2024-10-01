variable "name" {}
 variable "cidr_block" {}

 variable "azs" {
   type = list(string)
 }

variable "public_subnet_tags" {
  type    = map(string)
  default = {
    "us-west-1a" = ""
  }
}

variable "private_subnet_tags" {
  type    = map(string)
  default = {
    "us-west-1b" = ""
  }
}

 variable "account_owner" {
   default = ""
 }