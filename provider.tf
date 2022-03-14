provider "google" {
  credentials=file("serviceaccount.json")
  project     = "projectvpcpoc-2"
  region      = "us-central1"
}
provider "kubernetes" {
       config_path    = "~/GKE/kubeconfig-prod1"
    
}
