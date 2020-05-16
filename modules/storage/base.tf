resource "alicloud_oss_bucket" "mybucket"{
  bucket = var.bucket_name
  acl = "private"

  server_side_encryption_rule {
    sse_algorithm = "AES256"
  }

}
