variable "enabled" {
  description = "Controls creation fo all resources in this module."
  default = false
  type    = bool
}

variable "parent_workspace_id" {
  description = "For our run triggers."
  default     = null
  type        = string
}

variable "environment" {
  description = "Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT'"
  type        = string
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "project_values" {
  type        = map
  description = "Map of project-level environment variables"
}

variable "global_values" {
  type        = map
  description = "Map of project-level Terraform variables"
}

variable "organization" {
  type        = string
  description = "Name of the organization."
}

variable "projects_path" {
  description = "Project directory repository-root-relative path"
  type        = string
  default     = "projects"
}

variable "custom_project_folder" {
  description = "Use this to override the name of the project folder"
  type        = string
  default     = null
}

variable "vcs_repo" {
  description = "The VCS repository to configure."
  default     = {}
  type        = map(string)
}

variable "terraform_version" {
  type        = string
  description = "The version of Terraform to use for this workspace."
  default     = null
}

variable "auto_apply" {
  type        = bool
  description = "Controls the auto_apply flag within a Terraform workspace."
  default     = false
}

variable "filename_trigger" {
  type        = string
  description = "Controls which file(s) will trigger workspace executions."
  default     = "*.tf"
}