terraform {
  backend "gcs" {
    bucket = "epam-project-331618-331617-tfstate"
    prefix = "jenkins"
  }
}