output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = module.vnet.vnet_id
}

output "subnet_ids" {
  description = "Subnet IDs"
  value       = module.vnet.subnet_ids
}

output "nsg_id" {
  description = "NSG ID"
  value       = module.vnet.nsg_id
}