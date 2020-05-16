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
  description = "List of CIDR that will be assigned to the vswitches"
}
variable "cidr_subnets_names" {
  type = list
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
  description = "Name of the CEN Instance that we will create"
}
variable "region" {
  default = "eu-central-1"
  description = "Name of the Region"
}
