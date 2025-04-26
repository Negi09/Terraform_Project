 terraform{
backend "s3" {
    bucket         = "my-tf-bucket-bn"  # Use your existing bucket name here
    key            = "terraform/state/terraform.tfstate"  # Specify the path in the bucket
    region         = "us-east-1"
    encrypt= true 
    
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
 }


# Configure the AWS Provider
provider "aws" {
  region = var.regionname
}

