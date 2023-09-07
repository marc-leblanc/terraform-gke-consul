resource "helm_release" "consul" {
  name             = "consul"
  namespace        = var.consul_ns
  create_namespace = true
  repository       = "https://helm.releases.hashicorp.com"
  chart            = "consul"
  values = [
    templatefile("${path.module}/templates/consul-values.yaml", {
      datacenter               = var.consul_dc_name
      federation               = var.federation_toggle
      apigateway               = var.apigateway_toggle
      meshgateway              = var.meshgateway_toggle
      replicas                 = var.consul_server_replicas
      manageSystemACLs         = var.consul_manage_acls
      prometheus_agent_metrics = var.consul_prometheus_agent_enable
      ingressgateways          = var.ingressgateway_toggle
      ingressgateways_svc      = var.ingressgateway_svc
      prometheus_ns            = var.prometheus_ns
    })
  ]
}

data "kubernetes_service" "consul_ui" {
  metadata {
    name      = "consul-ui"
    namespace = var.consul_ns
  }
  depends_on = [
    helm_release.consul
  ]
}


resource "kubectl_manifest" "proxy_defaults" {
  count = var.meshgateway_toggle ? 1 : 0

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
