output "application_access" {
  value       = [for x in module.container[*] : x]
  description = "The name and port for each application."
}
