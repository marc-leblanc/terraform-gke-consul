
resource "kubernetes_namespace" "grafana" {
  count = var.grafana_enable ? 1 : 0

  metadata {
    name = var.grafana_ns
  }
}


resource "kubernetes_config_map" "consul-dashboard" {
  count = var.grafana_enable ? 1 : 0

  metadata {
    name      = "consul-dashboard"
    namespace = var.grafana_ns
  }

  data = {
    "consul-dashboard.json" = templatefile("${path.module}/assets/dashboards/consul-metrics.json", {
      DS_THANOS-MASTER = var.consul_dashboard_uid
    })

  }

  depends_on = [resource.kubernetes_namespace.grafana]
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
      grafana_svc_type     = var.grafana_svc_type
      prometheus_ns        = var.prometheus_ns
      consul_dashboard_uid = var.consul_dashboard_uid
    })
  ]
}