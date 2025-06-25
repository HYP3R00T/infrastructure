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
