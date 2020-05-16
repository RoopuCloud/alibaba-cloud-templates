module "storage" {
  source = "./modules/storage"

  # VARIABLES
  bucket_name = var.bucket_name
}

module "networking" {
  source = "./modules/networking"

  # VARIABLES
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  cidr_subnets = var.cidr_subnets
  cidr_subnets_names = var.cidr_subnets_names
  rt_name = var.rt_name
  security_group_name = var.security_group_name
  cen_name = var.cen_name
  region = var.region
}

module "compute" {
  source = "./modules/compute"

  # VARIABLES
  ecs_name = var.ecs_name
  alicloud_vswitch_id = module.networking.alicloud_vswitch_id
  alicloud_security_group_id = module.networking.alicloud_security_group_id
}

module "security" {
  source = "./modules/security"

  # VARIABLES
  ADName = var.ADName
  list_admin_policies = var.list_admin_policies
}
