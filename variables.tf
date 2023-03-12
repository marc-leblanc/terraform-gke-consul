variable "consul_namespace" {
  description = "Namespace for consul deployment on GKE"
  default     = "consul"
}

variable "consul_type" {
  description = "Insecure/Secure"
  default     = "secure"
}

variable "grafana_enable" {
  description = "Install Grafana"
  type        = bool
  default     = false
}
