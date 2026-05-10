locals {
  env    = var.environment
  prefix = "${var.project}-${local.env}"
}

# Random prefix for resource naming
resource "random_id" "prefix" {
  byte_length = 4
}

# Random suffix for globally-unique resource names
resource "random_id" "suffix" {
  byte_length = 4
}

# Random pet name used as a human-readable identifier
resource "random_pet" "instance_name" {
  length    = 2
  separator = "-"
  prefix    = local.prefix
}

# Random password for a mock database credential
resource "random_password" "db_password" {
  length           = 24
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>?"
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
}

# Mock compute instance (null_resource simulates a real VM)
resource "null_resource" "web_instance" {
  triggers = {
    name     = random_pet.instance_name.id
    password = random_password.db_password.bcrypt_hash
  }
}

# Mock storage bucket using the random-generated suffix
resource "null_resource" "storage_bucket" {
  triggers = {
    bucket_name = "${local.prefix}-bucket-${random_id.suffix.hex}"
    region      = var.region
  }
}
