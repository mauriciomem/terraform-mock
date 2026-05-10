# terraform-mock

A lightweight Terraform mock repository used for testing and experimentation. It simulates cloud infrastructure — compute instances, storage buckets, and database credentials — using the `null`, `random`, and `local` HashiCorp providers instead of real cloud resources.

## Purpose

- Validate Terraform workflows (init, plan, apply) without provisioning real infrastructure
- Experiment with naming conventions, variable validation, and output structures
- Serve as a sandbox for tooling and CI/CD pipeline development

## Resources

| Resource | Type | Description |
|---|---|---|
| `random_pet.instance_name` | `random_pet` | Human-readable name for mock compute instances |
| `random_id.suffix` | `random_id` | Unique hex suffix for globally-unique resource names |
| `random_password.db_password` | `random_password` | Mock database credential (24-char, special chars) |
| `null_resource.web_instance` | `null_resource` | Simulated compute instance |
| `null_resource.storage_bucket` | `null_resource` | Simulated storage bucket |

## Requirements

- Terraform `>= 1.7.0`
- Providers: `hashicorp/random ~> 3.6`, `hashicorp/null ~> 3.2`, `hashicorp/local ~> 2.5`

## Usage

```bash
terraform init
terraform plan -var="environment=dev"
terraform apply
```
