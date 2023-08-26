output "instances" {
  description = "SSO instances arn and identity_store_id"
  value       = local.instances
}

output "permission_sets" {
  description = "SSO permission_sets."
  value       = local.permission_sets
}
