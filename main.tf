 terraform {
 2   required_providers {
 3     docker = {
 4       source  = "kreuzwerker/docker"
 5       version = "~> 2.13.0"
 6     }
 7   }
 8 }
 9
10 provider "docker" {}
11
12 resource "docker_image" "nginx" {
13   name         = "nginx:latest"
14   keep_locally = false
15 }
16
17 resource "docker_container" "nginx" {
18   image = docker_image.nginx.latest
19   name  = "tutorial"
20   ports {
21     internal = 80
22     external = 8000
23   }
24 }
25
26


