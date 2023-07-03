resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

module kubernetes-deployment {
  source = "../kubernetes-deployment"
  environment_name = var.environment_name
  namespace = var.namespace
  label = var.label
}

module kubernetes-service {
  source = "../kubernetes-service"
  environment_name = var.environment_name
  namespace = var.namespace
  node_port = var.node_port
  selector = kubernetes_deployment.selector
}