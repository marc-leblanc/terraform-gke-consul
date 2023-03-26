[![pre-commit](https://github.com/Arctiq-Terraform-Modules/terraform-consul-gke/actions/workflows/pre-commit-checks.yaml/badge.svg?branch=main)](https://github.com/Arctiq-Terraform-Modules/terraform-consul-gke/actions/workflows/pre-commit-checks.yaml)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.9.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.18.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.9.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.18.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.consul](https://registry.terraform.io/providers/hashicorp/helm/2.9.0/docs/resources/release) | resource |
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/2.9.0/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/hashicorp/helm/2.9.0/docs/resources/release) | resource |
| [kubectl_manifest.proxy_defaults](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [kubernetes_service.consul_svc](https://registry.terraform.io/providers/hashicorp/kubernetes/2.18.1/docs/data-sources/service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_consul_dc_name"></a> [consul\_dc\_name](#input\_consul\_dc\_name) | Consul Datacenter Name | `string` | `"dc-gke"` | no |
| <a name="input_consul_manage_acls"></a> [consul\_manage\_acls](#input\_consul\_manage\_acls) | Enable/disable system ACLS | `string` | `"false"` | no |
| <a name="input_consul_ns"></a> [consul\_ns](#input\_consul\_ns) | Namespace for Consul installation | `string` | `"consul"` | no |
| <a name="input_consul_prometheus_agent_enable"></a> [consul\_prometheus\_agent\_enable](#input\_consul\_prometheus\_agent\_enable) | Enable Prometheus Agent metrics. This should be used for Demo/Non-Prod only | `bool` | `false` | no |
| <a name="input_consul_prometheus_enable"></a> [consul\_prometheus\_enable](#input\_consul\_prometheus\_enable) | Enable Prometheus. This should be used for Demo/Non-Prod only | `bool` | `false` | no |
| <a name="input_consul_server_replicas"></a> [consul\_server\_replicas](#input\_consul\_server\_replicas) | Consul server replica count. This will also be used for the Bootstrap exepect value. | `string` | `3` | no |
| <a name="input_federation_toggle"></a> [federation\_toggle](#input\_federation\_toggle) | Toggle Consul Mesh federation on/off | `bool` | `false` | no |
| <a name="input_grafana_enable"></a> [grafana\_enable](#input\_grafana\_enable) | Install Grafana | `bool` | `false` | no |
| <a name="input_grafana_ns"></a> [grafana\_ns](#input\_grafana\_ns) | Namespace for Grafana installation | `string` | `"grafana"` | no |
| <a name="input_grafana_svc_type"></a> [grafana\_svc\_type](#input\_grafana\_svc\_type) | Type of kubernetes service used for grafana | `string` | `"ClusterIP"` | no |
| <a name="input_ingressgateway_svc"></a> [ingressgateway\_svc](#input\_ingressgateway\_svc) | Default Ingress Gateway service type | `string` | `"LoadBalancer"` | no |
| <a name="input_ingressgateway_toggle"></a> [ingressgateway\_toggle](#input\_ingressgateway\_toggle) | Turn Ingress Gatways On/Off | `bool` | `false` | no |
| <a name="input_meshgateway_toggle"></a> [meshgateway\_toggle](#input\_meshgateway\_toggle) | Toggle Consul Mesh gateway on/off | `bool` | `false` | no |
| <a name="input_prometheus_ns"></a> [prometheus\_ns](#input\_prometheus\_ns) | Namespace for Prometheus installation | `string` | `"prometheus"` | no |
| <a name="input_prometheus_svc_type"></a> [prometheus\_svc\_type](#input\_prometheus\_svc\_type) | Type of kubernetes service used for prometheus | `string` | `"ClusterIP"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mesh_gateway_addr"></a> [mesh\_gateway\_addr](#output\_mesh\_gateway\_addr) | n/a |
