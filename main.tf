terraform {
  required_providers {
     docker= {
     source = "kreuzwerker/docker"
     version ="~>3.0.1"
}
}
}

provider "docker" {}

resource "docker_image" "nginx" {
        name = "nginx:latest"
        keep_locally = false
}

resource "docker_container" "nginx_cont" {
        image = docker_image.nginx.name
        name= "docker_deployment"
        ports {
              internal = 80
              external = 80
             }
}
