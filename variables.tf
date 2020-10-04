variable "token" {
  description = "TFE token"
}

variable "organization" {
  description = "Name of the organization."
}

variable "vcs_repo" {
  description = "The VCS repository to configure."
  default = {
  }
  type = map(string)
}

variable "runtriggers" {
  description = "Map of Run Triggers for Terraform Enterprise"
  default     = {}
}

variable "workspace_id" {
  description = "ID of TFE Workspace"
}

variable "workspace_ids" {
  description = "Map of All TFE Workspace IDs"
}

variable "variables" {
  description = "Map of environment or Terraform variables to define in the workspace."
  default     = {}
}

variable "hcl" {
  default = false
}

variable "config_name" {
  description = "Configuration File Name of the workspace"
}

variable "file_triggers_enabled" {
  description = "Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run."
  default     = true
}