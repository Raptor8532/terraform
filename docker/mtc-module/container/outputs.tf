output "ip-address" {
  value       = join(":", [docker_container.nodered_container.network_data[0].ip_address, docker_container.nodered_container.ports[0].external])
  description = "The ip address of the container"
}

output "container-name" {
  value       = docker_container.nodered_container.name
  description = "The name of the containers"
}
