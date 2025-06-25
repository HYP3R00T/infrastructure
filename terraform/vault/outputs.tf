output "role_id" {
  value = vault_approle_auth_backend_role.cloudflared.role_id
}

output "secret_id" {
  value     = vault_approle_auth_backend_role_secret_id.cloudflared.secret_id
  sensitive = true
}
