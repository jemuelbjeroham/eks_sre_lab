terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "jem-eks-sre-bucket"
    key            = "../bootstrap-backend/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"

  }
}
