resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = format("%s-nginx", var.environment_name)
    namespace = var.namespace
    labels = {
      App = var.label
    }
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        App = var.label
      }
    }
    template {
      metadata {
        labels = {
          App = var.label
        }
      }
      spec {
        container {
          image = var.image
          name  = var.environment_name

          port {
            container_port = var.containerport
          }

          resources {
            limits = {
              cpu    = var.cpu_limit
              memory = var.memory_limit
            }
            requests = {
              cpu    = var.cpu_requests
              memory = var.memory_requests
            }
          }
        }
      }
    }
  }
}