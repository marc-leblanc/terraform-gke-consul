resource "kubernetes_namespace" "consul-namespace" {
  metadata {
    name = var.consul_namespace
  }
}

resource "helm_release" "consul" {
  name      = "consul"
  namespace = kubernetes_namespace.consul-namespace.metadata[0].name

  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  values = [
    templatefile("${path.module}/templates/consul-${var.consul_type}.tmpl", {
      datacenter       = var.consul_dc_name
      federation       = var.federation_toggle
      meshgateway      = var.meshgateway_toggle
      replicas         = var.consul_server_replicas
      manageSystemACLs = var.consul_manage_acls
    })
  ]
}
data "kubernetes_service" "consul_svc" {
  depends_on = [
    resource.helm_release.consul
  ]
  metadata {
    namespace = "consul"
    name      = "consul-mesh-gateway"
  }
}
resource "kubectl_manifest" "proxy_defaults" {


  yaml_body = <<YAML

  apiVersion: consul.hashicorp.com/v1alpha1
  kind: ProxyDefaults
  metadata:
    name: global
  spec:
  meshGateway:
    mode: 'local'
}
YAML
  depends_on = [
    resource.helm_release.consul

  ]
}


resource "helm_release" "grafana" {
  count = var.grafana_enable ? 1 : 0

  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
}

output "mesh_gateway_addr" {
  value = data.kubernetes_service.consul_svc.status[0].load_balancer[0].ingress[0].ip
}
