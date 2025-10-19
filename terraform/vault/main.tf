provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  path = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "k3s" {
  backend            = vault_auth_backend.kubernetes.path
  kubernetes_host    = var.kubernetes_host
  kubernetes_ca_cert = var.kubernetes_ca_cert
  token_reviewer_jwt = var.token_reviewer_jwt
  disable_iss_validation  = true
}

resource "vault_mount" "external_secrets" {
  path        = "external-secrets"
  type        = "kv-v2"
  description = "KV v2 used by External Secrets Operator"
}

module "eso" {
  source           = "./eso"
  kubernetes_backend_path = vault_auth_backend.kubernetes.path

  depends_on = [
    vault_kubernetes_auth_backend_config.k3s,
    vault_mount.external_secrets
  ]
}
