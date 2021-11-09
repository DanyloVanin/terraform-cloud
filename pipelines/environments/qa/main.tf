/*****************************************
  Locals
 *****************************************/
locals {
  vpc_network_name = "example-vpc-${var.environment}"
  vm_name = "example-vm-${var.environment}-001"
}

/*****************************************
  Google Provider Configuration
 *****************************************/
provider "google" {
  version = ">= 2.18.0"
}

/*****************************************
  Create a VPC Network 
 *****************************************/
module "gcp-network" {
  source       = "terraform-google-modules/network/google"
  version      = ">= 1.4.0"
  project_id   = var.project_id
  network_name = local.vpc_network_name

  subnets = [
    {
      subnet_name   = "${local.vpc_network_name}-${var.subnet1_region}"
      subnet_ip     = var.subnet1_cidr
      subnet_region = var.subnet1_region
    },
  ]
}

/*****************************************
  Create a GCE VM Instance
 *****************************************/
resource "google_cloud_run_service" "main" {
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