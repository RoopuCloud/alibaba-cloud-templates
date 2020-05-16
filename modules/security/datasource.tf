data "alicloud_account" "current"{
}

data "template_file" "AssumeRoleWithSAML_policy" {
  template = "${file("${path.module}/policy.json.tpl")}"

  vars = {
    account_id = data.alicloud_account.current.id
    ad_name = var.ADName
  }
}