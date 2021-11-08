terraform {
  backend "gcs" {
    bucket = "epam-project-331519-tfstate"
    prefix = "jenkins"
  }
}