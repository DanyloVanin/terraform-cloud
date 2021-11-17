terraform {
  backend "gcs" {
    bucket = "epam-demo-terraform-tfstate"
    prefix = "env/qa"
  }
}