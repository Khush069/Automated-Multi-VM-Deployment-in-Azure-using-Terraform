# List of VM names to create
variable "vm_names" {
  type    = list(string)
  default = ["vm1", "vm2"]  # Add more names if needed
}

# Admin username for VMs
variable "admin_username" {
  type    = string
  default = "azureuser"
}

# Admin password for VMs
variable "admin_password" {
  type    = string
  default = "ComplexPassword123!"  # Use secure methods for production
}

# Location for all resources
variable "location" {
  type    = string
  default = "Central India"
}
