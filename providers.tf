# configure aws provider
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

# configure gcp provider
provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}
