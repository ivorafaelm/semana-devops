terraform {
  required_providers {
    kind = {
      source = "kyma-incubator/kind"
      version = "0.0.11"
    }
  }
}

provider "kind" {
  # Configuration options
}

provider "kubernetes" {
  config_path    = kind_cluster.default.kubeconfig_path
}

resource "kind_cluster" "default" {
  name = var.name
  wait_for_ready = true
  kind_config {
    kind = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }

    node {
      role = "worker"
    }
  }
}

resource "kubernetes_namespace" "namespace_de_teste" {
  metadata {
    name = "giropops"
  }
  depends_on = [
    kind_cluster.default
  ]
}

resource "kubernetes_deployment" "deployment_de_teste" {
  metadata {
    name = "strigus"
    namespace = kubernetes_namespace.namespace_de_teste.metadata[0].name
    labels = {
      app = "strigus"
    }
  }

  depends_on = [
    kubernetes_namespace.namespace_de_teste
  ]

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "strigus"
      }
    }

    template {
      metadata {
        labels = {
          app = "strigus"
        }
      }

      spec {
        container {
          image = "camillamartins/docker-linuxtips:1.0"
          name  = "example"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}



