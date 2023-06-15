locals {
  location      = "eastus"
  environment = "dev"
  name        = "skaf"
  additional_tags = {
    Owner      = "SaturnOps"
    Expires    = "Never"
    Department = "Engineering"
  }
  address_space = "10.10.0.0/16"
}


module "vnet" {
  source                  = "../../"
  name                    = "skaf"
  address_space           = "10.0.0.0/16"
  environment             = "production"
  zones                   = 2
  create_vnet             = true
  resource_group_location      = local.location
  create_public_subnets   = true
  create_private_subnets  = true
  create_database_subnets = true
  create_nat_gateway      = true
  enable_logging          = true
  create_vpn              = true
  additional_tags         = local.additional_tags
}