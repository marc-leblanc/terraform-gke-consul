
output "consul_ui_url" {
  value = (
    data.kubernetes_service.consul_ui.spec.0.type == "ClusterIP" ?
    "http://${data.kubernetes_service.consul_ui.spec.0.cluster_ip}:${data.kubernetes_service.consul_ui.spec.0.port.0.port}" :
    data.kubernetes_service.consul_ui.spec.0.type == "LoadBalancer" ?
    (
      length(data.kubernetes_service.consul_ui.status.0.load_balancer.0.ingress.0.ip) > 0 ?
      "http://${data.kubernetes_service.consul_ui.status.0.load_balancer.0.ingress.0.ip}:${data.kubernetes_service.consul_ui.spec.0.port.0.port}" :
      "http://${data.kubernetes_service.consul_ui.status.0.load_balancer.0.ingress.0.hostname}:${data.kubernetes_service.consul_ui.spec.0.port.0.port}"
    ) :
    data.kubernetes_service.consul_ui.spec.0.type == "NodePort" ?
    "http://${data.kubernetes_service.consul_ui.spec.0.cluster_ip}:${data.kubernetes_service.consul_ui.spec.0.port.0.node_port}" : ""
  )
}