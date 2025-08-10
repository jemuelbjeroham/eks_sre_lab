output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = module.eks.cluster_certificate_authority_data
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "vpc_id" {
  description = "VPC ID where EKS is deployed"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private subnet IDs for the cluster"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public subnet IDs for the cluster"
  value       = module.vpc.public_subnets
}
