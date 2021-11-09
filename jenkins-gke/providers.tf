/*****************************************
  Google Provider Configuration
 *****************************************/
provider "google" {
  version = ">= 3.1"
}

provider "google-beta" {
  version = ">= 3.1"
}

/*****************************************
  Kubernetes provider configuration
 *****************************************/
provider "kubernetes" {
  version                = ">= 1.10"
  host                   = module.jenkins-gke.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.jenkins-gke.ca_certificate)
}

/*****************************************
  Helm provider configuration
 *****************************************/
module "gke_auth" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  version = ">= 9.1"

  project_id   = module.project-services.project_id
  cluster_name = module.jenkins-gke.name
  location     = module.jenkins-gke.location
}

provider "helm" {
  kubernetes {
    cluster_ca_certificate = module.gke_auth.cluster_ca_certificate
    host                   = module.gke_auth.host
    token                  = module.gke_auth.token
    config_path            = "~/.kube/config"
  }
}