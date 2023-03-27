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

locals {
  consul_dashboard_json = file("${path.module}/assets/dashboards/consul-metrics.json")
}

data "template_file" "consul_dashboard_configmap" {
  template = file("${path.module}/assets/configmaps/consul-metrics-dashboard-cm.yaml")

  vars = {
    consul_dashboard_json = local.consul_dashboard_json
    grafana_ns            = var.grafana_ns
  }
}

resource "kubernetes_manifest" "consul_dashboard" {
  manifest = yamldecode(data.template_file.consul_dashboard_configmap.rendered)
}

resource "helm_release" "grafana" {
  count = var.grafana_enable ? 1 : 0

  name             = "grafana"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  namespace        = var.grafana_ns
  create_namespace = true
  values = [
    templatefile("${path.module}/templates/grafana-values.yaml", {
      grafana_svc_type     = var.prometheus_svc_type
      prometheus_ns        = var.prometheus_ns
      consul_dashboard_uid = var.consul_dashboard_uid
    })
  ]
}


resource "helm_release" "prometheus" {
  count = var.grafana_enable ? 1 : 0

  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"
  create_namespace = true
  namespace        = var.prometheus_ns
  values = [
    templatefile("${path.module}/templates/prometheus-values.yaml", {
      prometheus_svc_type = var.prometheus_svc_type
      consul_namespace    = var.consul_ns
      consul_datacenter   = var.consul_dc_name
      consul_ns           = var.consul_ns

    })
  ]
}
