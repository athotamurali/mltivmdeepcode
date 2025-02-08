# variables.tf
variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "adminuser"
}

variable "public_key_path" {
  description = "Path to the public SSH key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
