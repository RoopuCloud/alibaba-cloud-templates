resource "alicloud_ram_role" "admin_role" {
  name = "Administrator"
  document = data.template_file.AssumeRoleWithSAML_policy.rendered
  force = true
}

resource "alicloud_ram_role_policy_attachment" "admin_role_attach" {
  count = length(var.list_admin_policies)
  policy_name = element(var.list_admin_policies, count.index)
  policy_type = "System"
  role_name = alicloud_ram_role.admin_role.name
}
