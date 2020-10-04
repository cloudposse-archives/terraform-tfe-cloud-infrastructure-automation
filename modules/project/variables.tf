variable "config_name" {
  type = string
}

variable "projects" {
  type = any
}

variable "organization" {
  description = "Name of the organization."
}

variable "projects_path" {
  description = "Project directory repository-root-relative path"
  default     = "projects/"
  type        = string
}

variable "vcs_repo" {
  description = "The VCS repository to configure."
  default = {
  }
  type = map(string)
}
