
resource "helm_release" "prometheus" {
  count = var.consul_prometheus_enable ? 1 : 0

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
