variable "organization" {
  default     = "HashiCorp_AWS_Org"
  type        = string
  description = "workspace to deploy to"
}

variable "github_installation_id" {
  type        = string
  description = "VCS installation ID to access repo"
  default     = null
}

variable "oauth_token_id" {
  type        = string
  description = "VCS installation ID to access repo"
  default     = null
}

variable "tfc_vault_addr" {
  type        = string
  default     = "changeme"
  description = "Vault_Addr environment variable"
}