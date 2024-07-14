variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "private_subnet_1a" {
  type        = string
  description = "ID of the first private subnet"
}

variable "private_subnet_1b" {
  type        = string
  description = "ID of the second private subnet"
}

variable "desired_size" {
  type        = number
  description = "Desired number of nodes in the EKS cluster"
}

variable "max_size" {
  type        = number
  description = "Maximum number of nodes in the EKS cluster"
}

variable "min_size" {
  type        = number
  description = "Minimum number of nodes in the EKS cluster"
}