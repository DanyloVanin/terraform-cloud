terraform {
  backend "gcs" {
    bucket = "epam-project-demo-tfstate"
    prefix = "jenkins"
  }
}