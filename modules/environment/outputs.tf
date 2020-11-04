output "workspace" {
  description = "List of all workspaces created."
  value       = module.workspace.workspace
}

output "projects" {
  description = "List of all projects created."
  value       = module.projects
}
