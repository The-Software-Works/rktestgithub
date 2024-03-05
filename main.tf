module "vm" {
  source          = "./modules/vm"
  #subscription_id = var.subscription_id
  #client_id       = var.client_id
  #client_secret   = var.client_secret
  #tenant_id       = var.tenant_id
  location        = var.location
  vnet_name     = var.vnet_name
  resource_group_name = var.resource_group_name
 # address_space   = var.address_space
  subnet_name    = var.subnet_name
  public_ip_name  = var.public_ip_name
  nic_name  = var.nic_name
  vm_name  = var.vm_name
  vm_size  = var.vm_size
  admin_username  = var.admin_username
  admin_password = var.admin_password
  
}


