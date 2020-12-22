output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = google_container_cluster.primary.name
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "lb_ip" {
  value = kubernetes_service.website.load_balancer_ingress[0].hostname
}