terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source = "hashicorp/google"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

locals {
  business = "pyxintel"
  project = "website"
  environment = "dev"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  load_config_file = false

  host = google_container_cluster.primary.endpoint
  username = var.gke_username
  password = var.gke_password

  client_certificate = base64decode(google_container_cluster.primary.master_auth.0.client_certificate)
  client_key = base64decode(google_container_cluster.primary.master_auth.0.client_key)
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}