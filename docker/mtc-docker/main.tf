terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}
provider "docker" {
}

resource "null_resource" "dockervol" {

  provisioner "local-exec" {
    command = "mkdir noderedvol/ || true && chown -R 1000:1000 noderedvol/"
  }
}


resource "docker_image" "nodered_image" {
  name = lookup(var.image, terraform.workspace, "nodered/node-red:latest")
}

resource "random_string" "random" {
  count   = local.container_count
  length  = 4
  upper   = false
  special = false
}

resource "docker_container" "nodered_container" {
  count = local.container_count
  name  = join("-", ["nodered", terraform.workspace, random_string.random[count.index].result])
  image = docker_image.nodered_image.image_id
  ports {
    internal = var.int_port
    external = var.ext_port[terraform.workspace][count.index]
  }
  volumes {
    container_path = "/data"
    host_path      = "${path.cwd}/noderedvol"
  }
}
