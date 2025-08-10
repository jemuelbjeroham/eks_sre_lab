variable "region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "sre-eks-cluster"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
