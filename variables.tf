variable "region" {
  description = "Region name where terraform will be executed"
  default = "eu-central-1"
}
variable "access_key" {
  default = "youraccesskey"
}
variable "access_secret" {
  default = "youraccesssecret"
}

#compute
variable "ecs_name" {
  type = string
  default = "myecs"
}

# storage
variable "bucket_name" {
  type = string
  default = "mybucketname"
}

# networking
variable "vpc_name" {
  default = "myvpc"
  description = "Name of the VPC that we will create"
}
variable "vpc_cidr" {
  default = "10.0.0.0/8"
  description = "VPC CIDR range"
}
variable "cidr_subnets" { 
  type = list
  default = ["10.11.10.0/24","10.11.11.0/24"]
  description = "List of CIDR that will be assigned to the vswitches"
}
variable "cidr_subnets_names" {
  type = list
  default = ["mysubnet1","mysubnet2"]
  description = "Name of the vSwitches that we will create"
}
variable "rt_name" {
  default = "myroutetable"
  description = "Name of the Route Table that we will create"
}
variable "security_group_name" {
  default = "mysecuritygroup"
  description = "Name of the Security Group that we will create"
}
variable "cen_name" {
  default = "mycen"
  description = "Name of the CEN instance that we will create"
}

# security
variable ADName {
  default = "myadname"
}
variable list_admin_policies {
  default = ["AliyunRAMFullAccess","AdministratorAccess"]
}
