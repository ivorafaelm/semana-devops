provider "kubernetes" {
  config_path    = "../cluster/${var.name}-config"
  config_context = "kind-${var.name}"
}

resource "kubernetes_namespace" "namespace_de_teste" {
  metadata {
    name = "giropops"
  }
}

resource "kubernetes_deployment" "deployment_de_teste" {
  metadata {
    name = "strigus"
    namespace = kubernetes_namespace.namespace_de_teste.metadata[0].name
    labels = {
      app = "strigus"
    }
  }

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