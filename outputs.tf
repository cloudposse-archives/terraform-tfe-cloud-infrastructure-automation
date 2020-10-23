output "global_workspace" {
  value = module.tfc_config.workspace
}

output "environment_workspaces" {
  value = local.environment_workspaces
}

output "project_workspaces" {
  value = local.project_workspaces
}
