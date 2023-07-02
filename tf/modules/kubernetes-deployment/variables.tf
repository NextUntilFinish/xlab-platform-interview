variable "environment_name" {
    type = string
}

variable "namespace" {
    type = string
}

variable "label" {
    type = string
}

variable "replicas" {
    type = number
    default = "2"
}

variable "image" {
    type = string
    default = "nginx"
}

variable "containerport" {
    type = number
    default = 80
}

variable "cpu_limit" {
    type = string
    default = "0.5"
}

variable "memory_limit" {
    type = string
    default = "512Mi"
}

variable "cpu_requests" {
    type = string
    default = "250m"
}

variable "memory_requests" {
    type = string
    default = "50Mi"
}