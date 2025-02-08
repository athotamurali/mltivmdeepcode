variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
}

variable "vm_size" {
  description = "Size of the VMs"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}
