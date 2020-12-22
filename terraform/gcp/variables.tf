variable "project_id" {
  default = "pyxintel-lab-1"
  description = "GCP roject ID"
}

variable "region" {
  default = "europe-west1"
  description = "GCP region"
}

variable "service_account" {
  default = "867201228371-compute@developer.gserviceaccount.com"
  description = "Service account to associate to the nodes in the cluster"
}

variable "gke_username" {
  default = "gkeuser"
  description = "GKE username"
}

variable "gke_password" {
  default = "gkep4ss@pyxintel!"
  description = "GKE password"
}

variable "gke_num_nodes" {
  default = 2
  description = "Number of GKE nodes"
}

