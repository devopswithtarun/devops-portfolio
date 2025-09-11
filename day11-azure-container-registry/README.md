### 🌐 Day 11 — Azure Container Registry (ACR) + Pipelines

## 🎯 Goal
Build a Docker image, push it to Azure Container Registry (ACR), and (optionally) deploy a container instance — all using Azure services.

## 🛠 Prerequisites
- You have:
  - Azure subscription.
  - Azure CLI (`az`) installed in your WSL.
  - Docker working in your WSL (or via Docker Desktop).
  - Azure DevOps project connected to your GitHub repo.

## 1️⃣ Create Azure Container Registry (ACR)
- From VS Code WSL terminal:
# Login to Azure (WSL)
az login
# Set your subscription (replace with your ID if different)
az account set --subscription "2a9db437-643e-4ecf-bb9d-87ffd7ae769d"
# Create a resource group (if not already made for containers)
az group create --name day11-acr-rg --location uksouth
# Create the ACR
az acr create \
  --resource-group day11-acr-rg \
  --name tarundevopsacr \
  --sku Basic
# Verify:
az acr list --resource-group day11-acr-rg --output table

## 2️⃣ Build and Push Docker Image to ACR (manual first)
# Login Docker to ACR
az acr login --name tarundevopsacr
# Get the ACR login server name
az acr list --resource-group day11-acr-rg --query "[].loginServer" --output table
# Example: tarundevopsacr.azurecr.io
# Build the image (tag with ACR name)
cd ~/devops-labs/day10-docker-basics
docker build -t tarundevopsacr.azurecr.io/day10-nginx:latest .
# Push to ACR
docker push tarundevopsacr.azurecr.io/day10-nginx:latest
# Check in ACR:
az acr repository list --name tarundevopsacr --output table

## 3️⃣ Deploy a container instance (quick test)
az container create \
  --resource-group day11-acr-rg \
  --name day11-nginx-container \
  --image tarundevopsacr.azurecr.io/day10-nginx:latest \
  --cpu 1 --memory 1 \
  --registry-login-server tarundevopsacr.azurecr.io \
  --registry-username $(az acr credential show --name tarundevopsacr --query username -o tsv) \
  --registry-password $(az acr credential show --name tarundevopsacr --query passwords[0].value -o tsv) \
  --ports 80 \
  --os-type Linux \
  --ip-address public

## ✋🏻🛑⛔️ Ah! The error messages give the clues:
1️⃣ Admin user is disabled on your ACR
- Before using --registry-username and --registry-password, you must enable the admin account:
- az acr update -n tarundevopsacr --admin-enabled true
2️⃣ Argument expansion issue
In your command, $(az acr credential show ...) failed because admin was disabled. Once admin is enabled, the command will correctly fetch the username and password.

# Get the public IP:
az container show \
  --resource-group day11-acr-rg \
  --name day11-nginx-container \
  --query ipAddress.ip \
  --output tsv

- Open in browser: http://<ip> — you should see your Day 10 page.

## 4️⃣ Automate with Azure DevOps pipeline (build + push)
- Use azure-pipeline.yml for reference.
🔹 You must create an Azure Container Registry service connection in Azure DevOps named tarundevopsacr-service-connection (or whatever name you put in YAML above).
🔹 This service connection stores credentials so the pipeline can push to ACR securely.

## 5️⃣ Update GitHub repo

## 📸 Screenshots
- ACR admin permission enable
- ACR credential-container creation
- ACR login-Docker build-push-show
- ACR show & Docker manual start
- ACR-azure portal
- az account set & ACR creation
- container create
- container show
- container show-delete
- container-azure portal
- resource group
- Webpage

## ✅ Skills learned
- Azure-native container registry setup
- Docker image tagging and pushing
- Deploying a container directly in Azure
- Integrating ACR with Azure DevOps pipelines
- End-to-end CI/CD for containers inside Azure
