variable "region" {
  type    = string
  default = "us-east-1"

}

variable "bucket_name" {
  type        = string
  description = "jem_eks_sre_bucket"
}

variable "dynamodb_table" {
  description = "jem_eks_sre_dynamodb_table"
  type        = string
  default     = "terraform-locks"
}

variable "environment" {
  description = "dev"
  type        = string
  default     = "dev"
}