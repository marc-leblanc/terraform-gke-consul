
variable "consul_dc_name" {
  description = "Consul Datacenter Name"
  default     = "dc-gke"
  type        = string
}

variable "federation_toggle" {
  type        = bool
  description = "Toggle Consul Mesh federation on/off"
  default     = false
}

variable "meshgateway_toggle" {
  type        = bool
  description = "Toggle Consul Mesh gateway on/off"
  default     = false
}
variable "consul_server_replicas" {
  type        = string
  description = "Consul server replica count. This will also be used for the Bootstrap exepect value."
  default     = 3

}

variable "consul_manage_acls" {
  type        = string
  description = "Enable/disable system ACLS"
  default     = "false"
}

variable "grafana_enable" {
  description = "Install Grafana"
  type        = bool
  default     = false
}

variable "grafana_ns" {
  description = "Namespace for Grafana installation"
  type        = string
  default     = "grafana"
}

variable "prometheus_ns" {
  type        = string
  description = "Namespace for Prometheus installation"
  default     = "prometheus"
}

variable "consul_ns" {
  type        = string
  description = "Namespace for Consul installation"
  default     = "consul"

}

variable "grafana_svc_type" {
  type        = string
  description = "Type of kubernetes service used for grafana"
  default     = "ClusterIP"
}

variable "prometheus_svc_type" {
  type        = string
  description = "Type of kubernetes service used for prometheus"
  default     = "ClusterIP"
}

variable "consul_prometheus_enable" {
  default     = false
  description = "Enable Prometheus. This should be used for Demo/Non-Prod only"
  type        = bool
}

variable "consul_prometheus_agent_enable" {
  default     = false
  description = "Enable Prometheus Agent metrics. This should be used for Demo/Non-Prod only"
  type        = bool
}

variable "ingressgateway_toggle" {
  type        = bool
  description = "Turn Ingress Gatways On/Off"
  default     = false
}

variable "ingressgateway_svc" {
  type        = string
  description = "Default Ingress Gateway service type"
  default     = "LoadBalancer"

}

variable "consul_dashboard_uid" {
  type        = string
  description = "Custom UID for the Grafana Dashboard to force a slug"
  default     = "consul"
}
