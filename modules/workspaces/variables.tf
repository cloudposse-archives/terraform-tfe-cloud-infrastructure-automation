variable "agent_pool_id" {
  type        = string
  description = "ID of the Terraform Cloud agent pool. If set, `execution_mode` is ignored and `agent` is used."
  default     = null
}

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

variable "execution_mode" {
  type        = string
  description = "Indicates whether the workspace is applied remotely, locally, or via agent."

  validation {
    condition     = contains(["remote", "local", "agent"], var.execution_mode)
    error_message = "The execution_mode value must be either `remote`, `local`, or `agent`."
  }
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
  type        = list(any)
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

variable "vcs_branch_override" {
  description = "Use this to override the branch you want your workspace to plan / apply against."
  default     = null
  type        = string
}

variable "working_directory" {
  description = "A relative path that Terraform will execute within. Defaults to the root of your repository."
  default     = null
}
