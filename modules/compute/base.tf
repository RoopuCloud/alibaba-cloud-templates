resource "alicloud_instance" "ecs_instance" {
  vswitch_id                 = var.alicloud_vswitch_id
  image_id                   = data.alicloud_images.ecs_image.images.0.id
  instance_type              = data.alicloud_instance_types.ecs_type.instance_types.0.id
  system_disk_category       = "cloud_efficiency"
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = 5
  security_groups            = [var.alicloud_security_group_id]
  instance_name              = var.ecs_name
}