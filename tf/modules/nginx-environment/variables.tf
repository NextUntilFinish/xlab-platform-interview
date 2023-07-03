variable "environment_name" {
    type = string
}

variable "node_port" {
    type = number
}

# TODO: Set some logical limits on this using a precondition
variable "cpu_limit" {
    type = string
    default = "0.5"
}

# TODO: Set some logical limits on this using a precondition
variable "memory_limit" {
    type = string
    default = "512Mi"
}

# TODO: Set some logical limits on this using a precondition
variable "cpu_requests" {
    type = string
    default = "250m"
}

# TODO: Set some logical limits on this using a precondition
variable "memory_requests" {
    type = string
    default = "50Mi"
}