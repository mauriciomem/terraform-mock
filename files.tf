# Rendered config file written to local disk — simulates an app config artifact
resource "local_file" "app_config" {
  filename        = "${path.module}/.generated/app.conf"
  content         = templatefile("${path.module}/templates/app.conf.tftpl", {
    instance_name = random_pet.instance_name.id
    region        = var.region
    environment   = var.environment
    db_password   = random_password.db_password.result
    bucket        = "${local.prefix}-bucket-${random_id.suffix.hex}"
  })
  file_permission = "0600"
}
