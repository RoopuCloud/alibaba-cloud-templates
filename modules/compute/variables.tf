variable "ecs_name" {
  type = string
  default = "myecs"
}
variable "alicloud_vswitch_id" { 
  type = string
  description = "ID of an vswitch"
}
variable "alicloud_security_group_id" { 
  type = string
  description = "ID of the security group"
}
