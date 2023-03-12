## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |

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
| [helm_release.consul](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.proxy_defaults](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [kubernetes_namespace.consul-namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_service.consul_svc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_consul_namespace"></a> [consul\_namespace](#input\_consul\_namespace) | Namespace for consul deployment on GKE | `string` | `"consul"` | no |
| <a name="input_consul_type"></a> [consul\_type](#input\_consul\_type) | Insecure/Secure | `string` | `"secure"` | no |
| <a name="input_grafana_enable"></a> [grafana\_enable](#input\_grafana\_enable) | Install Grafana | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mesh_gateway_addr"></a> [mesh\_gateway\_addr](#output\_mesh\_gateway\_addr) | n/a |
