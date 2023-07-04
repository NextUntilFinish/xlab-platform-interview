terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

variable "host" {
  type = string
}


variable "client_cert" {
  type = string
}

variable "client_key" {
  type = string
}

variable "cluster_cert" {
  type = string
}

provider "kubernetes" {
  host = var.host

  client_certificate     = base64decode(var.client_cert)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_cert)
}

resource "kubernetes_namespace" "dev_namespace" {
  metadata {
    name = "dev"
  }
}

module nginx {
  source = "./modules/nginx"
  namespace = "dev"
  
  for_each = {
    dev = 30201
    stg = 30202
    prd = 30203
  }
  
  environment_name = each.key
  node_port = each.value
}