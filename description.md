[![pre-commit](https://github.com/Arctiq-Terraform-Modules/terraform-consul-gke/actions/workflows/pre-commit-checks.yaml/badge.svg?branch=main)](https://github.com/Arctiq-Terraform-Modules/terraform-consul-gke/actions/workflows/pre-commit-checks.yaml)

# Consul on GKE Module

This opinionated module deploys HashiCorp's Consul service mesh on GKE. It will likely work on AKS/EKS and possibly OpenShift as well, but it has been tested for GKE. Also bundled are optional capabilities to deploy Prometheus and Grafana complete with a pre-configured Prometheus Datasource and Consul Dashboard for Grafana. 

![Consul on GKE with Prometheus and Grafana](./diagrams/consul_on_gke_with_optional_prometheus_and_grafana.png)

