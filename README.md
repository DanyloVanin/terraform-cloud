# Repository containing GCP infrastructure for Jenkins and dev/prod environments

## Notes
The **dev** branch contains the latest changes that are applied to the development environment.
The **prod** branch contains the latest changes that are applied to the production environment.

## Folders
- ```/jenkins-gke``` - contains scripts required to deploy Jenkins in a new GKE cluster.
- ```/environments``` - contains dev and prod environment folders with backend configurations and links to files from the ```create/``` folder.
- ```/create``` - contains Terraform code for creating a virtual machine in your environment.
- ```/pipelines``` - contains subfolders with the pipelines.

**Reference:** 
- https://github.com/GoogleCloudPlatform/solutions-terraform-jenkins-gitops
- https://cloud.google.com/architecture/managing-infrastructure-as-code-with-terraform-jenkins-and-gitops