# Day 5 – Azure Networking with Terraform (VNet, Subnet, NSG)

## 📌 Overview
This project sets up the **networking foundation** for Azure infrastructure using Terraform. It creates:

- **Resource Group** — container for all resources
- **Virtual Network (VNet)** — a private network in Azure
- **Subnet** — a logical segment inside the VNet
- **Network Security Group (NSG)** — firewall rules to control traffic
- **SSH Rule** — allows port 22 access **only from my IP**

This network will later be used for deploying secure Virtual Machines and other services.

---

## 🏗️ Architecture
- **Address space:** `10.20.0.0/16`
- **Subnet range:** `10.20.1.0/24`
- **NSG rule:** inbound TCP `22` (SSH) from `MY_PUBLIC_IP/32`

---

## 📂 Project Structure
terraform-iac/day5-networking/
├── provider.tf # Azure provider configuration
├── variables.tf # Input variables (prefix, location, SSH CIDR)
├── main.tf # All networking resources
├── outputs.tf # Resource names after deployment
├── terraform.tfvars # Variable values (location, IP)
└── screenshots/ # Screenshots of deployment and portal verification

1. # Initialize Terraform:
terraform init
2. # Validate:
terraform validate
3. # Plan:
terraform plan -out=tfplan
4. # Apply:
terraform apply tfplan
5. # Verify in Azure Portal:
Resource Group
VNet
Subnet
NSG + SSH rule
6. # Destroy when done (to save credits):
terraform destroy -auto-approve

🖼️ Screenshots
# Screenshots include:
1. CLI outputs (init, validate, plan, apply, outputs, destroy)
2. zure portal views (Resource Group, VNet, Subnet, NSG + rules)

🧩 Lessons Learned

# Basics of Azure networking: VNet, Subnet, and NSGs
# Importance of restricting SSH access for security
# How to organize Terraform files and variables
# Using .gitignore to avoid committing .terraform/ and state files
# Safe Git workflow: add → commit → pull (rebase) → push