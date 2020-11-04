variable "auto_apply" {
  description = "Whether to automatically apply changes when a Terraform plan is successful."
  default     = false
}

variable "file_triggers_enabled" {
  description = "Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run."
  default     = true
}

variable "name" {
  description = "Configuration File Name of the workspace"
  type        = string
}

variable "notifications" {
  description = "Map of `tfe_notification_configurations` to define in the workspace."
  default     = {}
  type        = map(object({ configuration = map(string), triggers = list(string) }))
}

variable "operations" {
  description = "Whether to use remote execution mode. When set to false, the workspace will be used for state storage only. Defaults to `true`."
  default     = true
  type        = bool
}

variable "organization" {
  description = "Name of the organization."
}

variable "queue_all_runs" {
  description = "Whether all runs should be queued. When set to false, runs triggered by a VCS change will not be queued until at least one run is manually queued."
  default     = true
  type        = bool
}

variable "ssh_key_id" {
  description = "The ID of an SSH key to assign to the workspace."
  default     = null
}

variable "team_access" {
  description = "Associate teams to permissions on the workspace."
  default     = {}
  type        = map(string)
}

variable "terraform_version" {
  description = "The version of Terraform to use for this workspace."
  default     = null
  type        = string
}

variable "trigger_prefixes" {
  description = "List of paths relative to the repository root which describe all locations to be tracked for changes in the workspace."
  default     = null
  type        = list
}

variable "variables" {
  description = "Map of environment or Terraform variables to define in the workspace."
  default     = {}
  type        = map(map(string))
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
