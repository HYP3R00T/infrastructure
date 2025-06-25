provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

# Load HCL policy from external file
resource "vault_policy" "cloudflared" {
  name   = "cloudflared-read"
  policy = file(var.policy_file_path)
}

resource "vault_auth_backend" "approle" {
  type = "approle"
  path = "approle" # This makes it available at auth/approle/
}

resource "vault_approle_auth_backend_role" "cloudflared" {
  role_name      = "cloudflared-role"
  backend        = vault_auth_backend.approle.path
  token_policies = [vault_policy.cloudflared.name]
  bind_secret_id = true
  depends_on     = [vault_auth_backend.approle]
}


resource "vault_approle_auth_backend_role_secret_id" "cloudflared" {
  role_name  = vault_approle_auth_backend_role.cloudflared.role_name
  backend    = vault_auth_backend.approle.path
  depends_on = [vault_approle_auth_backend_role.cloudflared]
}
