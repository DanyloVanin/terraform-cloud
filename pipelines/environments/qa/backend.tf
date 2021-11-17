terraform {
  backend "gcs" {
    bucket = "epam-demo-terraform"
    prefix = "env/qa"
  }
}