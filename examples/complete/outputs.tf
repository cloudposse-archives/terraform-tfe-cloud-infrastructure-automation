output "global_workspace" {
  value       = module.example.global_workspace
  description = "Configuration information for the global workspace."
}

output "global_workspace_id" {
  description = "Environment workspaces ids"
  value       = module.example.global_workspace.id
}

output "environment_workspaces_ids" {
  description = "Environment workspaces ids"
  value       = values(module.example.environment_workspaces)[*].workspace.id
}

output "project_workspaces_ids" {
  description = "Environment workspaces ids"
  value       = values(module.example.project_workspaces)[*].workspace.id
}

output "environment_workspaces" {
  value       = module.example.environment_workspaces
  description = "A list of environment workspaces & their configurations."
}

output "project_workspaces" {
  value       = module.example.project_workspaces
  description = "A list of project workspaces & their configurations."
}
