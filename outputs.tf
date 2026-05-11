output "instance_name" {
  description = "Human-readable name assigned to the compute instance."
  value       = random_pet.instance_name.id
}

output "resource_prefix" {
  description = "Random hex prefix prepended to resource names."
  value       = random_id.prefix.hex
}

output "resource_suffix" {
  description = "Random hex suffix appended to globally-unique resource names."
  value       = random_id.suffix.hex
}

output "bucket_name" {
  description = "Name of the mock storage bucket."
  value       = "${local.prefix}-bucket-${random_id.suffix.hex}"
}

output "db_password_hash" {
  description = "Bcrypt hash of the generated database password (safe to log)."
  value       = random_password.db_password.bcrypt_hash
  sensitive   = false
}

output "db_password" {
  description = "Generated database password. Marked sensitive — will not appear in plan output."
  value       = random_password.db_password.result
  sensitive   = true
}

output "config_file_path" {
  description = "Path to the rendered application config file."
  value       = local_file.app_config.filename
}
