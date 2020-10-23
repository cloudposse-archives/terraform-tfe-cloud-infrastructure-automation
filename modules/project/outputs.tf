output "workspace" {
  value = try(module.workspace[0].workspace, null)
}
