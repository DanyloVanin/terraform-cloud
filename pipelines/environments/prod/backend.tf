terraform {
  backend "gcs" {
    bucket = "epam-project-331618-tfstate"
    prefix = "env/prod"
  }
}