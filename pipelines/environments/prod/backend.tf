terraform {
  backend "gcs" {
    bucket = "epam-final-project-331617-tfstate"
    prefix = "env/prod"
  }
}