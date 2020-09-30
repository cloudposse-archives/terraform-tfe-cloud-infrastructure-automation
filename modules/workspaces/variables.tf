variable "config_name" {
  description = "Configuration File Name of the workspace"
}

variable "organization" {
  description = "Name of the organization."
}

variable "auto_apply" {
  description = "Whether to automatically apply changes when a Terraform plan is successful."
  default     = false
}

variable "file_triggers_enabled" {
  description = "Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run."
  default     = true
}

variable "notifications" {
  description = "Map of `tfe_notification_configurations` to define in the workspace."
  default = {
  }
  type = map(object({ configuration = map(string), triggers = list(string) }))
}

variable "queue_all_runs" {
  description = "Whether all runs should be queued. When set to false, runs triggered by a VCS change will not be queued until at least one run is manually queued."
  default     = true
}

variable "ssh_key_id" {
  description = "The ID of an SSH key to assign to the workspace."
  default     = null
}

variable "team_access" {
  description = "Associate teams to permissions on the workspace."
  default = {
  }
  type = map(string)
}

variable "terraform_version" {
  description = "The version of Terraform to use for this workspace."
  default     = null
}

variable "config__dir_prefix" {
  description = "Config directory repository-root-relative path"
  default     = "config/"
  type        = string
}

variable "project__dir_prefix" {
  description = "Project directory repository-root-relative path"
  default     = "projects/"
  type        = string
}

variable "trigger_prefixes" {
  description = "List of repository-root-relative paths which describe all locations to be tracked for changes. workspace. Defaults to the latest available version."
  default     = null
  type        = list
}

variable "variables" {
  description = "Map of environment or Terraform variables to define in the workspace."
  default = {
  }
  type = map(map(string))
}

variable "vcs_repo" {
  description = "The VCS repository to configure."
  default = {
  }
  type = map(string)
}

variable "working_directory" {
  description = "A relative path that Terraform will execute within. Defaults to the root of your repository."
  default     = null
}
