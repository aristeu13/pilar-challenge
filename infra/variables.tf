variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "region" {
  type        = string
  description = "AWS region for the EKS cluster"
  default     = "us-east-1"
}

variable "kubernetes_version" {
  type        = string
  description = "Version of Kubernetes to deploy"
  default     = "1.21"
}

variable "desired_size" {
  type        = number
  description = "Desired number of nodes in the EKS cluster"
}

variable "min_size" {
  type        = number
  description = "Minimum number of nodes in the EKS cluster"
}

variable "max_size" {
  type        = number
  description = "Maximum number of nodes in the EKS cluster"
}
