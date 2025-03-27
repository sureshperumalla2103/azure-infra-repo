variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "address_space" {
  description = "CIDR range for the VNET"
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnets to create"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "enable_nsg" {
  description = "Enable Network Security Group (NSG) for the subnets"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {}
}
