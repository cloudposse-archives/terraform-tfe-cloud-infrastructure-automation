output "global_workspace" {
  value       = module.tfc_config.workspace
  description = "Configuration information for the global workspace."
}

output "environment_workspaces" {
  value       = local.environment_workspaces
  description = "A list of environment workspaces & their configurations."
}

output "project_workspaces" {
  value       = local.project_workspaces
  description = "A list of project workspaces & their configurations."
}
