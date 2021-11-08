terraform {
  backend "gcs" {
    bucket = "epam-project-331519-tfstate"
    prefix = "env/prod"
  }
}