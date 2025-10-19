variable "role_name" {
  type    = string
  default = "eso"
}

variable "bound_service_account_names" {
  type    = list(string)
  default = ["external-secrets"]
}

variable "bound_service_account_namespaces" {
  type    = list(string)
  default = ["external-secrets"]
}

variable "kubernetes_backend_path" {
  type    = string
  default = "kubernetes"
}
