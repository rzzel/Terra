provider "aws" {
  region = "ap-northeast-1" 
}

data "aws_availability_zones" "available" {
}

data "aws_region" "current" {}

# Define VPC
data "aws_vpc" "default" {
  default = true
}

data "aws_key_pair" "key_ko" { 
  key_name = "key_ko" 
}

variable "private_subnets" {
  default = {
    "t3_tier"  = 250 
  }
}
