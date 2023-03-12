[![pre-commit](https://github.com/Arctiq-Terraform-Modules/terraform-consul-gke/actions/workflows/pre-commit-checks.yaml/badge.svg?branch=main)](https://github.com/Arctiq-Terraform-Modules/terraform-consul-gke/actions/workflows/pre-commit-checks.yaml)

# Consul on GKE

This module will set up a HashiCorp Consul cluster on an existing GKE cluster.

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
| [helm_release.consul](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.proxy_defaults](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [kubernetes_namespace.consul-namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_service.consul_svc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_consul_dc_name"></a> [consul\_dc\_name](#input\_consul\_dc\_name) | Consul Datacenter Name | `string` | `"dc-gke"` | no |
| <a name="input_consul_manage_acls"></a> [consul\_manage\_acls](#input\_consul\_manage\_acls) | Enable/disable system ACLS | `string` | `"false"` | no |
| <a name="input_consul_namespace"></a> [consul\_namespace](#input\_consul\_namespace) | Namespace for consul deployment on GKE | `string` | `"consul"` | no |
| <a name="input_consul_server_replicas"></a> [consul\_server\_replicas](#input\_consul\_server\_replicas) | Consul server replica count. This will also be used for the Bootstrap exepect value. | `string` | `3` | no |
| <a name="input_consul_type"></a> [consul\_type](#input\_consul\_type) | Insecure/Secure | `string` | `"secure"` | no |
| <a name="input_grafana_enable"></a> [grafana\_enable](#input\_grafana\_enable) | Install Grafana | `bool` | `false` | no |
| <a name="input_federation_toggle"></a> [federation\_toggle](#input\_federation\_toggle) | Toggle Consul Mesh federation on/off | `string` | `"false"` | no |
| <a name="input_meshgateway_toggle"></a> [meshgateway\_toggle](#input\_meshgateway\_toggle) | Toggle Consul Mesh gateway on/off | `string` | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mesh_gateway_addr"></a> [mesh\_gateway\_addr](#output\_mesh\_gateway\_addr) | n/a |
