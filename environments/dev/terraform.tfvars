vnet_name           = "dev-vnet"
location            = "East US"
resource_group_name = "challenge"
address_space       = ["10.0.0.0/16"]
subnets = [
  {
    name           = "dev-subnet-001"
    address_prefix = "10.0.1.0/24"
  },
  {
    name           = "dev-subnet-002"
    address_prefix = "10.0.2.0/24"
  }
]

enable_nsg = true

tags = {
  Environment = "dev"
  Owner       = "DevOps"
}

