# Day 4 – Terraform Azure Virtual Machine

## 📌 Project Overview
This project provisions an **Ubuntu 22.04 Virtual Machine** on Azure using **Terraform**.  
The deployment includes a complete network stack with VNet, Subnet, NSG, Public IP, NIC,  
and an Ubuntu Linux VM accessible via SSH key authentication.

This demonstrates how to move from **manual portal-based creation** to **Infrastructure as Code (IaC)**,  
a critical DevOps skill for reproducibility and automation.

---

## 🏗️ Architecture
The following resources are provisioned:
- **Resource Group** – container for all resources
- **Virtual Network (VNet)** – `10.10.0.0/16`
- **Subnet** – `10.10.1.0/24`
- **Network Security Group (NSG)** – allows inbound SSH (22) only from my IP
- **Public IP** – static, standard SKU
- **Network Interface (NIC)** – connected to subnet + public IP
- **Ubuntu 22.04 VM** – size: `Standard_B1s` (low-cost)

---

## ⚙️ Files
- `provider.tf` → provider config (azurerm)
- `variables.tf` → reusable input variables
- `main.tf` → all Azure resources (RG, VNet, NSG, VM, etc.)
- `outputs.tf` → public IP + SSH command
- `terraform.tfvars` → personal values (prefix, location, allowed_ssh_cidr)
- `screenshots/` → execution proof & portal views

---

## 🚀 Steps Performed

### 1. Init & Validate
terraform init
terraform validate

### 2. Plan & Apply
terraform plan -out=tfplan
terraform apply tfplan

### 3. Outputs
terraform output

### 4. SSH Login
ssh -i ~/.ssh/id_rsa ubuntu@<public_ip>

### 5. Destroy Resources
To avoid costs:
terraform destroy -auto-approve

#### ALL Screenshots of live working in Screenshots folder with commands, if you have any doubts please go through screenshots folder(mentioned with name description including Azure portal)