variable "agent_pool_id" {
  type        = string
  description = "ID of the Terraform Cloud agent pool. If set, `execution_mode` is ignored and `agent` is used."
  default     = null
}

variable "top_level_workspace" {
  type        = string
  description = "Name of the top-level configuration workspace in Terraform Cloud"
  default     = "tfc-config"
}

variable "config_auto_apply" {
  type        = bool
  description = "Controls Terraform Cloud workspace auto-apply feature"
  default     = true
}

variable "config_file_path" {
  type        = string
  description = "Relative path to YAML config files"
  default     = null
}

variable "config_file_pattern" {
  type        = string
  description = "File pattern used to locate configuration files"
  default     = "*.yaml"
}

variable "organization" {
  type        = string
  description = "Name of the organization."
}

variable "projects_path" {
  type        = string
  description = "Project directory path relative to the repository root"
  default     = "projects"
}

variable "tfc_project_path" {
  type        = string
  description = "Name of the working directory where the top-level Terraform Cloud project resides (e.g. within `projects_path`)."
  default     = "tfc"
}

variable "terraform_version" {
  type        = string
  description = "The version of Terraform to use for this workspace. Defaults to the latest available version."
  default     = null
}

variable "vcs_repo" {
  type        = map(string)
  description = "The VCS repository to configure."
  default     = {}
}
