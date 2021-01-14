output "global_workspace" {
  value       = module.example.global_workspace
  description = "Configuration information for the global workspace."
}

output "environment_workspaces" {
  value       = module.example.environment_workspaces
  description = "A list of environment workspaces & their configurations."
}

output "project_workspaces" {
  value       = module.example.project_workspaces
  description = "A list of project workspaces & their configurations."
}
