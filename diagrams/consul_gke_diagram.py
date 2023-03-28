from diagrams import Diagram, Cluster
from diagrams.onprem.network import Consul
from diagrams.gcp.compute import GKE
from diagrams.k8s.group import Namespace
from diagrams.k8s.infra import Node
from diagrams.onprem.monitoring import Prometheus, Grafana

with Diagram("Consul on GKE with Optional Prometheus and Grafana", show=False):
    with Cluster("GKE Cluster"):
        gke_master = GKE("Master")
        with Cluster("Worker Nodes"):
            nodes = [Node("Node 1"), Node("Node 2"), Node("Node 3")]

    consul_cluster = None
    prometheus_cluster = None
    grafana_cluster = None

    with Cluster("Namespaces"):
        with Cluster("Consul Namespace"):
            consul_cluster = Consul("Consul")
            consul_ui = Consul("Consul UI")

        with Cluster("Prometheus Namespace"):
            prometheus_cluster = Prometheus("Prometheus")

        with Cluster("Grafana Namespace"):
            grafana_cluster = Grafana("Grafana")

    gke_master >> nodes
    nodes >> consul_cluster
    consul_cluster >> consul_ui

    nodes >> prometheus_cluster

    nodes >> grafana_cluster
