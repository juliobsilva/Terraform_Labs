module "ModuleResourceGroup" {
  source                  = "./Modules/ResourceGroup"
  resource_group_name     = "RGPROD"
  resource_group_location = "Eastus"
  tag_name                = "PRD"
}

module "ModuleVirtualNetwork" {
  source                  = "./Modules/VirtualNetwork"
  resource_group_name     = module.ModuleResourceGroup.resource_group_name
  resource_group_location = module.ModuleResourceGroup.resource_group_location
  virtual_network_info    = var.virtual_network_info
  environment             = "prd"
}

module "ModuleSubNet" {
  source              = "./Modules/SubNet"
  resource_group_name = module.ModuleResourceGroup.resource_group_name
  subnet_info         = var.subnet_info
  depends_on          = [module.ModuleVirtualNetwork]
}

module "ModulePublicIp" {
  source                  = "./Modules/PublicIp"
  resource_group_name     = module.ModuleResourceGroup.resource_group_name
  resource_group_location = module.ModuleResourceGroup.resource_group_location
  vms_info                = var.vms_info
}

module "ModuleNetworkInterface" {
  source                  = "./Modules/NetworkInterface"
  resource_group_name     = module.ModuleResourceGroup.resource_group_name
  resource_group_location = module.ModuleResourceGroup.resource_group_location
  subnetid                = module.ModuleSubNet.sub_id
  ip-pub                  = module.ModulePublicIp.public_ip_id
  vms_info                = var.vms_info
}

module "ModuleSecurityGroup" {

  source                  = "./Modules/SecurityGroup"
  security_group_name     = "security-group-prod"
  resource_group_name     = module.ModuleResourceGroup.resource_group_name
  resource_group_location = module.ModuleResourceGroup.resource_group_location
  subnetid                = module.ModuleSubNet.sub_id

  depends_on = [module.ModuleSubNet]

}

module "ModuleSecurityGroupRules" {
  source                  = "./Modules/SecurityGroupRules"
  resource_group_name     = module.ModuleResourceGroup.resource_group_name
  resource_group_location = module.ModuleResourceGroup.resource_group_location
  security_group_name     = module.ModuleSecurityGroup.security_group_name
  listrules               = var.listrules
}

module "ModuleVirtualMachine" {
  source                  = "./Modules/VirtualMachine"
  resource_group_name     = module.ModuleResourceGroup.resource_group_name
  resource_group_location = module.ModuleResourceGroup.resource_group_location
  vms_info                = var.vms_info
  interface_ids           = module.ModuleNetworkInterface.output_network_interface
}

