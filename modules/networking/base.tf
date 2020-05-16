resource "alicloud_vpc" "vpc" {
  name = var.vpc_name
  cidr_block = var.vpc_cidr
}

resource "alicloud_vswitch" "vswitch" {
  vpc_id = alicloud_vpc.vpc.id
  count = length(var.cidr_subnets)
  availability_zone = lookup(data.alicloud_zones.zones_ds.zones[count.index],"id")
  cidr_block = element(var.cidr_subnets, count.index)
  name = element(var.cidr_subnets_names, count.index)
}

resource "alicloud_route_table" "route_table" {
  vpc_id = alicloud_vpc.vpc.id
  name = var.rt_name
}

resource "alicloud_route_table_attachment" "rt_attachment" {
  count = length(var.cidr_subnets)
  vswitch_id = alicloud_vswitch.vswitch.*.id[count.index]
  route_table_id = alicloud_route_table.route_table.id
}

resource "alicloud_security_group" "security_group" {
  name   = var.security_group_name
  vpc_id = alicloud_vpc.vpc.id
}

resource "alicloud_security_group_rule" "security_group_rules" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "internet"
  policy            = "accept"
  port_range        = "3389/3389"
  priority          = 10
  security_group_id = alicloud_security_group.security_group.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_cen_instance" "cen" {
  name        = var.cen_name
}

resource "alicloud_cen_instance_attachment" "cen_attachment" {
  instance_id              = alicloud_cen_instance.cen.id
  child_instance_id        = alicloud_vpc.vpc.id
  child_instance_region_id = var.region
}
