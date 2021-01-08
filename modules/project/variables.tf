variable "parent_workspace_id" {
  description = "Parent workspace ID for run triggers."
  default     = null
  type        = string
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "project_values" {
  type        = map(any)
  description = "Map of project-level environment variables"
}

variable "global_values" {
  type        = map(any)
  description = "Map of project-level Terraform variables"
}

variable "organization" {
  type        = string
  description = "Name of the organization."
}

variable "projects_path" {
  description = "Project directory path relative to the repository root"
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
