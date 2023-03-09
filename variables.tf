variable "consul_namespace" {
  description = "Namespace for consul deployment on GKE"
  default     = "consul"
  type        = string
}

variable "consul_type" {
  description = "Insecure/Secure"
  default     = "secure"
  type        = string
}

variable "consul_dc_name" {
  description = "Consul Datacenter Name"
  default     = "dc-gke"
  type        = string
}

variable "federation_toggle" {
  type        = string
  description = "Toggle Consul Mesh federation on/off"
  default     = "false"
}

variable "meshgateway_toggle" {
  type        = string
  description = "Toggle Consul Mesh gateway on/off"
  default     = "false"
}
