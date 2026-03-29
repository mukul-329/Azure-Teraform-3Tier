# Azure 3-Tier Architecture using Terraform

## Architecture
- Web Tier (Public)
- App Tier (Private)
- DB Tier (Azure SQL)

## Features
- Modular Terraform design
- Remote backend (Azure Storage)
- NSG security rules
- Azure Bastion (secure access)
- Load Balancer
- Key Vault for secrets
- CI/CD with GitHub Actions

## Usage

```bash
terraform init
terraform plan
terraform apply
