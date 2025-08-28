# Terraform - Infrastructure as Code (Day 3)

## Overview
This project demonstrates how to use Terraform to provision Azure resources.  
On Day 3, I created a **Resource Group** in Azure using Terraform.

## Steps Performed
1. Installed Terraform in WSL (Ubuntu).
2. Installed and configured Azure CLI.
3. Authenticated to Azure using `az login`.
4. Wrote Terraform configuration files:
   - `provider.tf`: defines Azure provider.
   - `main.tf`: creates a resource group.
   - `variables.tf`: stores variable definitions (optional).
5. Ran Terraform commands:
   - `terraform init`
   - `terraform plan`
   - `terraform apply`
6. Verified resource group in the Azure portal.
7. Documented the process with screenshots.

## Screenshots
- Terraform installation (`terraform -version`)
- Azure CLI login (`az login`)
- Terraform plan & apply output
- Azure Portal showing resource group

## Lessons Learned
- Infrastructure as Code (IaC) enables consistent and repeatable deployments.
- Terraform uses a declarative approach to manage cloud resources.
- Always run `terraform plan` before applying changes.