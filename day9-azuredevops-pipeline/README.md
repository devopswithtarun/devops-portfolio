# Day 9 – Azure DevOps CI/CD Pipeline with Terraform

## 🎯 Goal
Automate Terraform deployment using **Azure DevOps Pipelines** with secure secrets, SSH key management, and Azure service connections.

---

## 🛠 Steps

### 1. Prepare Azure DevOps Service Connection
1. Go to your Azure DevOps project → **Project Settings** → **Service connections**.
2. Click **New service connection** → Select **Azure Resource Manager**.
3. Use **App registration (automatic)**.
4. Scope level: **Subscription**.
5. Select your subscription.
6. Name it (example): `AzureServiceConnection`.
7. **Grant access permission to all pipelines** ✅

---

### 2. Add SSH Public Key as a Secret
1. Go to **Pipelines** → **Library** → **Variable groups**.
2. Create new group (e.g. `TerraformSecrets`).
3. Add variable:
   - Name: `TF_VAR_SSH_PUBLIC_KEY`
   - Value: your full SSH public key (`ssh-rsa AAAAB3NzaC1yc2E...`)
4. Mark it **secret**.
5. Link this group to the pipeline.

### 3. Push to GitHub
- From VS Code WSL terminal:
cd ~/devops-labs/cicd-pipeline/day9-azure-devops
# Initialize git if not already
git init
# Stage files
git add azure-pipelines.yml README.md
# Commit
git commit -m "Day 9 – Add Azure DevOps CI/CD pipeline with Terraform"
# Push to main repo
git push origin main

### 4. Run the Pipeline
- In Azure DevOps → Pipelines → New pipeline → Connect to your GitHub repo.
- Select azure-pipelines.yml in root (or subfolder — update path if needed).
- Run pipeline manually or wait for trigger on main.

### 5. 📸 Screenshots
- Azure DevOps service connection screen.
- Variable group with SSH key.
- Pipeline run (success).

### 6. ✅ Outcome
- Full CI/CD flow using Azure DevOps.
- Secrets and SSH keys securely injected.
- Terraform infrastructure deployed automatically.

### 7. 🔎 Notes
- Never commit private keys to GitHub.
- Always test with terraform plan before applying.
- Rotate service principal secrets regularly.