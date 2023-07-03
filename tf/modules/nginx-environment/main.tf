resource "kubernetes_namespace" "namespace" {
  metadata {
    name = tolower(var.environment_name)
  }
}

module kubernetes-deployment {
  source = "../kubernetes-deployment"
  environment_name = tolower(var.environment_name)
  namespace = tolower(var.namespace)
  label = format("%s-Nginx", var.environment_name)
}

module kubernetes-service {
  source = "../kubernetes-service"
  environment_name = var.environment_name
  namespace = tolower(var.namespace)
  node_port = var.node_port
  selector = kubernetes_deployment.selector
}