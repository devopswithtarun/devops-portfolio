# Day 6 – Terraform: Multi-VM Deployment on Azure

## 📝 Objective
Deploy **multiple Linux virtual machines** on Azure using Terraform, all connected to the same virtual network and subnet, with secure SSH access.

This builds on the networking and Terraform basics from Days 3–5.

---

## 📂 Files in this project
| File             | Purpose                                                        |
|-------------------|----------------------------------------------------------------|
| `provider.tf`     | Azure provider configuration                                  |
| `variables.tf`    | Input variables (e.g., resource group name, location, key)     |
| `main.tf`         | Actual Azure resources (network, subnet, NSG, NICs, VMs)      |
| `outputs.tf`      | Outputs for VM names and public IPs                            |
| `terraform.tfvars`| Values for variables (never committed — contains your SSH key) |
| `screenshots/`    | Screenshots of successful deployment and verification         |

---

## 🛠️ Steps

### 1. Prepare your SSH key
Terraform needs a valid **public** key for VM authentication.

If you already generated one on Day 2, you can reuse it:

```bash
- cat ~/.ssh/id_rsa.pub
# Or create a new one:
- ssh-keygen -t rsa -b 4096 -C "lavith1777@TarunAnu"
# Press Enter to accept defaults

# 2. Configure terraform.tfvars (local only)
- Create a file named terraform.tfvars (and make sure it’s in .gitignore):
- resource_group_name = "devops-rg-day6"
- location            = "UK South"
- vm_count            = 2
- admin_username      = "azureuser"
- ssh_public_key      = file("/home/lavith1777/.ssh/id_rsa.pub")

# 3. Initialize Terraform
- terraform init
# 4. Preview the plan
- terraform plan
# 5. Apply the configuration
- terraform apply
# Type 'yes' when prompted

# Terraform will deploy:
- A Resource Group
- Virtual Network and Subnet
- Network Security Group (allowing SSH only from your IP)
- Public IPs
- NICs
- Multiple VMs, controlled by the vm_count variable

# 6. Verify deployment
- In Azure Portal → Resource Group → Verify both VMs exist.
- Note the public IPs (also printed by Terraform output).
- SSH into each VM:
- ssh azureuser@<public_ip_of_vm>

# 7. Clean up
When finished (to save credits):
- terraform destroy
# Type 'yes' when prompted

🖼️ Screenshots
- All screenshots saved in ./screenshots/

💡 Key Learnings
- Using Terraform count or for_each to create multiple resources.
- How to securely handle SSH keys using file() and .gitignore.
- Infrastructure reusability — networking + compute in one Terraform project.

## 🔄 How Variables Flow in Terraform (Visual Overview)

```text
 ┌───────────────────┐        ┌───────────────────┐
 │ variables.tf      │        │ terraform.tfvars  │
 │ (declare inputs)  │◀──────▶│ (set values)      │
 └────────┬──────────┘        └────────┬──────────┘
          │                            │
          ▼                            │
 ┌─────────────────────────────────────┴─────────────────────┐
 │ main.tf / other .tf files                               │
 │ (infrastructure definition uses var.<name>)             │
 └────────┬────────────────────────────────────────────────┘
          │
          ▼
 ┌───────────────────┐
 │ Terraform Engine  │
 │ (plan & apply)    │
 └────────┬──────────┘
          │
          ▼
 ┌───────────────────┐
 │ Azure Resources   │
 │ (VMs, networks…)  │
 └───────────────────┘

- variables.tf → declares what values your code needs (vm_count, location, etc.).
- terraform.tfvars → provides the actual values (safe to .gitignore).
- main.tf (and others) → uses var.<name> in resource definitions.
- Terraform engine reads them all together when you run terraform plan and terraform apply.

🧠 Remember:
- count = simple scaling (N copies).
- for_each = custom config per key/value.
- .tfvars = keep secrets and environment differences out of main code.