variable "environment_name" {
    type = string
}

variable "namespace" {
    type = string
}

variable "selector" {
    type = string
}

variable "node_port" {
    type = number
}

variable "port" {
    type = number
    default = 80
}

variable "targetport" {
    type = number
    default = 80
}