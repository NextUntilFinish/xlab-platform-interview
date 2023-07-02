resource "kubernetes_service" "stg_nginx" {
  metadata {
    name      = format("%s-nginx", var.environment_name)
    namespace = var.namespace
  }
  spec {
    selector = {
      App = var.selector
    }
    port {
      node_port   = var.node_port
      port        = var.port
      target_port = var.targetport
    }

    type = "NodePort"
  }
}