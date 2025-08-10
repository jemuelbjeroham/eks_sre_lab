terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30"
    }
  }
  backend "s3" {
    bucket         = "jem-eks-sre-bucket"
    key            = "eks-project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"

  }
}
