variable "project_id" {
  type        = string
  description = "Project ID of GCP project to be used"
  default     = ""
}

variable "environment" {
  type        = string
  description = "Name of the environment (dev/prod/qa)"
  default     = "qa"
}

variable "subnet1_region" {
  type        = string
  description = "GCP Region where first subnet will be created"
  default     = "us-central1"
}
variable "app_image" {
  type        = string
  description = "Application container image used later in Cloud Run"
}