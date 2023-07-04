locals{
  App = format("%sNginx", var.environment_name)
  DeploymentName = format("%s-nginx", var.environment_name)
}

resource "kubernetes_deployment" "deployment" {
  metadata {
    name      = local.DeploymentName
    namespace = var.namespace
    labels = {
      App = local.App
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = local.App
      }
    }
    template {
      metadata {
        labels = {
          App = local.App
        }
      }
      spec {
        container {
          image = "nginx"
          name  = lower(var.environment_name)

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
  }
}

resource "kubernetes_service" "service" {
  metadata {
    name      = local.DeploymentName
    namespace = var.namespace
  }
  spec {
    selector = {
      App = kubernetes_deployment.deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      node_port   = var.node_port
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}