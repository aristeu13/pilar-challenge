variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "kubernetes_version" {
  type        = string
  description = "Version of Kubernetes to deploy"
}

variable "private_subnet_1a" {
  type        = string
  description = "ID of the first private subnet"
}

variable "private_subnet_1b" {
  type        = string
  description = "ID of the second private subnet"
}