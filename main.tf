/*
module "gke_auth" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  depends_on = [
    google_container_cluster.primary
  ]
  project_id   = var.project
  location     = "us-central1-a"
  cluster_name = google_container_cluster.primary.name
}
resource "local_file" "kubeconfig" {
  content  = module.gke_auth.kubeconfig_raw
  filename = "kubeconfig-${var.env_name}"
}
*/

resource "google_container_cluster" "primary" {
  name               = "cluster-demo"
  location           = "us-central1-a"
  initial_node_count = 3
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    #service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}
output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "master_version" {
  value = google_container_cluster.primary.master_version
}


