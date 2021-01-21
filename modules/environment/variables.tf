variable "agent_pool_id" {
  type        = string
  description = "ID of the Terraform Cloud agent pool. If set, `execution_mode` is ignored and `agent` is used."
  default     = null
}

variable "config_name" {
  type        = string
  description = "The name of the YAML configuration file used for this environment workspace (for the trigger prefix)."
}

variable "config_directory" {
  type        = string
  default     = "config"
  description = "The name of the configuration directory to use in the trigger prefix."
}

variable "filename_triggers" {
  type        = list(string)
  description = "Controls which file(s) will trigger workspace executions."
  default     = []
}

variable "global_values" {
  type        = map(any)
  default     = {}
  description = "The global values applied to all workspaces within the environment."
}

variable "projects" {
  type        = any
  default     = {}
  description = "A map of all projects and related configurations that exist within the environment."
}

variable "projects_path" {
  default     = "projects"
  type        = string
  description = "The relative pathname where all projects reside (used for trigger prefixes)."
}

variable "organization" {
  type        = string
  description = "Name of the organization."
}

variable "terraform_version" {
  default     = null
  type        = string
  description = "The top level terraform_version that is used if not overriden by the project."
}

variable "vcs_repo" {
  description = "The VCS repository to configure."
  default = {
  }
  type = map(string)
}
