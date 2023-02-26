terraform {
  required_version = ">= 1.3.9" //change version 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.71.0"
    }
  }
}


//provider "aws" {
  //# Configuration options
//}
