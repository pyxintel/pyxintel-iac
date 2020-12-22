resource "kubernetes_deployment" "website" {
  metadata {
    name = "pyxintel-website"
    labels = {
      App = "Pyxintel"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "Pyxintel"
      }
    }
    template {
      metadata {
        labels = {
          App = "Pyxintel"
        }
      }
      spec {
        container {
          image = "pyxintel/website:test"
          name  = "website"

          port {
            container_port = 8080
          }

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "website" {
  metadata {
    name = "website"
  }
  spec {
    selector = {
      App = kubernetes_deployment.website.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
