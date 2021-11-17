terraform {
  backend "gcs" {
    bucket = "epam-project-demo"
    prefix = "env/qa"
  }
}