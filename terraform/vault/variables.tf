variable "vault_address" {
  type        = string
  description = "Vault server address"
}

variable "vault_token" {
  type        = string
  description = "Vault root or admin token"
  sensitive   = true
}

variable "policy_file_path" {
  description = "Path to the Vault policy file"
  type        = string
  default     = "../../vault/policies/cloudflared-policy.hcl"
}

variable "kubernetes_host" {
  type        = string
  description = "Kubernetes API server URL"
}

variable "kubernetes_ca_cert" {
  type        = string
  description = "Kubernetes CA certificate"
}

variable "token_reviewer_jwt" {
  type        = string
  description = "Token reviewer JWT from SA vault-token-reviewer"
  sensitive   = true
}
