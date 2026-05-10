# Mock data sources — simulate lookups that would hit a real provider API

# In a real setup this might be aws_ami, google_compute_image, etc.
# Using local_file as a stand-in data source to keep this self-contained.
data "local_file" "bootstrap_script" {
  filename = "${path.module}/templates/bootstrap.sh"
}

# Read an existing generated config if it exists (used in update scenarios)
data "local_sensitive_file" "existing_config" {
  count    = fileexists("${path.module}/.generated/app.conf") ? 1 : 0
  filename = "${path.module}/.generated/app.conf"
}
