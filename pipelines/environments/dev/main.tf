/*****************************************
  Google Provider Configuration
 *****************************************/
provider "google" {
  version = ">= 2.18.0"
}

/*****************************************
  Activate CloudRun Service
 *****************************************/
module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = ">= 10.0"

  project_id = var.project_id

  activate_apis = [
    "iam.googleapis.com",
    "run.googleapis.com",
    "compute.googleapis.com",
    "storage-component.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "artifactregistry.googleapis.com"
  ]
}

/*****************************************
  Create a GCE VM Instance
 *****************************************/
resource "google_cloud_run_service" "default" {
  name     = "cloudrun-dev"
  location = var.subnet1_region
  project = var.project_id

  template {
    spec {
      containers {
        image = var.app_image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  autogenerate_revision_name = true
}

# Allow unauthenticated users to invoke the service
resource "google_cloud_run_service_iam_binding" "binding" {
  location = google_cloud_run_service.default.location
  project = google_cloud_run_service.default.project
  service = google_cloud_run_service.default.name
  role = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}