
variable "project" {
  default = "projectvpcpoc-2"
}

variable "location" {
  default = "us-central1"
}

variable "initial_node_count" {
  default = 1
}

variable "machine_type" {
  default = "n1-standard-1"
}
/*
variable "path" {
    default="C:/Users/THLOHITH/Desktop/terraformdemo/demo1/analysis"
}*/
variable "env_name" {
  description = "The environment for the GKE cluster"
  default     = "prod1"
}