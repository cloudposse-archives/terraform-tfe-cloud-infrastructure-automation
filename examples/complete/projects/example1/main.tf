variable "my_input_var" {
  type    = string
  default = ""
}

output "dummy_output" {
  value = var.my_input_var
}