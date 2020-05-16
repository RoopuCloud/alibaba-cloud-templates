data "alicloud_instance_types" "ecs_type" {
  cpu_core_count    = 1
  memory_size       = 2
}

data "alicloud_images" "ecs_image" {
  name_regex  = "^ubuntu_18.*64"
  most_recent = true
  owners      = "system"
}