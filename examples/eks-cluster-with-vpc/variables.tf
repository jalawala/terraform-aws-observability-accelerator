variable "cluster_name" {
  description = "Name of cluster - used by Terratest for e2e test automation"
  type        = string
  default     = "eks-observability-1"

  validation {
    # cluster name is used as prefix on eks_blueprint module and cannot be >25 characters
    condition     = can(regex("^[a-zA-Z][-a-zA-Z0-9]{3,24}$", var.cluster_name))
    error_message = "Cluster name is used as a prefix-name for other resources. Max size is 25 chars and must satisfy regular expression pattern: '[a-zA-Z][-a-zA-Z0-9]{3,19}'."
  }
}
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}
variable "managed_node_instance_type" {
  description = "Instance type for the cluster managed node groups"
  type        = string
  default     = "t3.xlarge"
}
variable "managed_node_min_size" {
  description = "Minumum number of instances in the node group"
  type        = number
  default     = 3
}
variable "eks_version" {
  type        = string
  description = "EKS Cluster version"
  default     = "1.27"
}
