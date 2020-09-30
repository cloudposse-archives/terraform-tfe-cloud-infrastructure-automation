output "id" {
  description = "The workspace's human-readable ID, which looks like `<ORGANIZATION>/<WORKSPACE>`."
  value       = tfe_workspace.this.id
}

output "name" {
  description = "The workspace's name"
  value       = tfe_workspace.this.nameß
}