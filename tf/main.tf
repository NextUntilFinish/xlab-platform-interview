terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

locals {
  certs = [
    base64decode(var.client_cert),
    base64decode(var.client_key),
    base64decode(var.cluster_cert),
  ]
}

module "nginx" {
  source = "hashicorp/kubernetes/modules/deployment"

  name = "nginx"
  namespace = "dev"
  labels = {
    App = "Nginx"
  }
  replicas = 2
  selector = {
    match_labels = {
      App = "Nginx"
    }
  }
  template {
    metadata {
      labels = {
        App = "Nginx"
      }
    }
    spec {
      container {
        image = "nginx"
        name = "nginx"

        port {
          container_port = 80
        }

        resources {
          limits = {
            cpu    = "0.5"
            memory = "512Mi"
          }
          requests = {
            cpu    = "250m"
            memory = "50Mi"
          }
        }
      }
    }
  }

  service {
    name = "nginx"
    port {
      node_port = 30201
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

resource "kubernetes_deployment" "dev_nginx" {
  depends_on = [module.nginx]
}

resource "kubernetes_service" "dev_nginx" {
  depends_on = [module.nginx]
}

resource "kubernetes_deployment" "stg_nginx" {
  depends_on = [module.nginx]
}

resource "kubernetes_service" "stg_nginx" {
  depends_on = [module.nginx]
}