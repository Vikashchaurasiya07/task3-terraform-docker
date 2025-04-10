terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "inspireme_image" {
  name = "inspireme-app:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "inspireme_container" {
  name  = "inspireme-app"
  image = docker_image.inspireme_image.name

  ports {
    internal = 3000
    external = 8080
  }
}
