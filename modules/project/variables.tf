variable "enabled" {
  default = false
  type = bool
}

variable "parent_workspace_id" {
  description = "For our run triggers."
  default = null
  type = string
}

variable "environment" {
  type = string
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

variable "vcs_repo" {
  description = "The VCS repository to configure."
  default = {}
  type = map(string)
}

variable "terraform_version" {
  type        = string
  description = "The version of Terraform to use for this workspace."
  default     = null
}