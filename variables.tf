# #######################################################
# Commmon variables. Usually required across ALL modules.
# #######################################################
variable "location" {
  description = "The Azure region to deploy the resources to. Defaults to West Europe."
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "The name of the resource group where the new KEY VAULT should be created."
  type        = string
}

variable "tenant_id" {
  description = "The Id of the Azure AD Tenant where the resources will be created"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to add to the resources being deployed"
  type        = map(string)
  default = {
    DeployedBy = "Terraform"
  }
}

####################################
# Variables specific to this module.
####################################
variable "kv_name" {
  description = "The name to assign to the new KeyVault"
  type        = string
}

variable "kv_allowed_cidr" {
  description = "Public IP addresses (in CIDR notation) that can access the KeyVault."
  type        = list(string)
  default     = null
}

variable "kv_default_action" {
  description = "The Default Action to use when theres no match to the IP Rules. Possible values are Allow and Deny."
  type        = string
  default     = "Deny"
}

variable "la_workspace_id" {
  description = "The ID of the Log Analytics workspace where all logs should be sent."
  type        = string
}
