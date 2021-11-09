terraform {
  backend "gcs" {
    bucket = "epam-demo-project-331616-tfstate"
    prefix = "jenkins"
  }
}