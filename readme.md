# Simple VPN between AWS and GCP

This project uses Terraform to buil a *Simple* VPN tunnel between
an AWS VPC and a GCP Network with static routes (no BGP)

Do **NOT** use this project in production environment.  
In production you should consider [HA VPN](https://cloud.google.com/network-connectivity/docs/vpn/tutorials/create-ha-vpn-connections-google-cloud-aws)

## Parameters
- **aws_profile**  : profile for connection to AWS Account hosting VPC
- **aws_region**   : AWS region
- **aws_vpc_id**   : AWS VPC ID
- **gcp_project**  : GCP Project ID
- **gcp_region**   : GCP region
- **gcp_vpc_name** : GCP Network Name

## Usage
First, configure your AWS profile
```bash
aws configure --profile my-profile
```

Then, connect to GCP project
```bash
gcloud auth application-default login --project "my-project-id"
```

Write a **terraform.tfvars** file like this one:
```bash
aws_profile  = "my-profile"
aws_region   = "eu-west-3"
aws_vpc_id   = "vpc-0123456789abcdeda"
gcp_project  = "my-project-id"
gcp_region   = "europe-west1"
gcp_vpc_name = "my-network"
```

If you plan to share your *tfstate*, add a **backend.tf** file:
```
# tfstate repository
terraform {
  backend "s3" {
    profile = "my-backend-profile"
    region  = "eu-west-1"
    bucket  = "my-tfstate-bucket"
    key     = "vpn-aws2gcp.tfstate"
  }
}
```

Finally, use the well-known Terraform commands:
```bash
terraform init
terraform plan
terraform apply
```
