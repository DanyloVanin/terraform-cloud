/*****************************************
  Google Provider Configuration
 *****************************************/
provider "google" {
  version = ">= 2.18.0"
}

/*****************************************
  Create a GCE VM Instance
 *****************************************/
resource "google_cloud_run_service" "run_service" {
  name     = "cloudrun-qa"
  location = var.subnet1_zone

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
resource "google_cloud_run_service_iam_member" "run_all_users" {
  service  = google_cloud_run_service.run_service.name
  location = google_cloud_run_service.run_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}