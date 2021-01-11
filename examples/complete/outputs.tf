output "example" {
  description = "Outputs for the example module"
  value       = module.example
}

output "global_workspace_id" {
  description = "Environment workspaces ids"
  value       = module.example.global_workspace.id
}

output "environment_workspaces_ids" {
  description = "Environment workspaces ids"
  value       = values(module.example.environment_workspaces)[*].id
}

output "project_workspaces_ids" {
  description = "Environment workspaces ids"
  value       = values(module.example.project_workspaces)[*].id
}
