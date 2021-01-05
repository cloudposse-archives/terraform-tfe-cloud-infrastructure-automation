variable "enabled" {
  description = "Controls creation fo all resources in this module."
  default     = false
  type        = bool
}

variable "parent_workspace_id" {
  description = "Parent workspace ID for run triggers."
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
  type        = any
  description = "Map of project-level environment variables"
}

variable "global_values" {
  type        = map
  description = "Map of project-level Terraform variables"
}

variable "execution_mode" {
  type        = string
  description = "Indicates whether the workspace is applied remotely, locally, or via agent."

  validation {
    condition     = contains(["remote", "local", "agent"], var.execution_mode)
    error_message = "The execution_mode value must be either `remote`, `local`, or `agent`."
  }
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

variable "vcs_branch" {
  description = "Use this to override the branch you want your workspace to plan / apply against."
  default     = null
  type        = string
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

variable "filename_triggers" {
  type        = list(string)
  description = "Controls which file(s) will trigger workspace executions."
  default     = []
}
