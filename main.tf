module "rg" {
  source   = "./modules/resource_group"
  rg_name  = var.resource_group_name
  location = var.location
}

module "network" {
  source    = "./modules/network"
  rg_name  = module.rg.rg_name
  location = var.location
  vnet_cidr = var.vnet_cidr
}

module "web" {
  source    = "./modules/web"
  rg_name  = module.rg.rg_name
  location = var.location
  subnet_id = module.network.web_subnet_id
}

module "app" {
  source    = "./modules/app"
  rg_name  = module.rg.rg_name
  location = var.location
  subnet_id = module.network.app_subnet_id
}

module "db" {
  source    = "./modules/db"
  rg_name  = module.rg.rg_name
  location = var.location
  subnet_id = module.network.db_subnet_id
}
