##### 📄 Day 10 — Docker Basics

## 🌎 Why we need Docker & Containers in the Cloud World
- Even though we already have:
- Azure Cloud (for infrastructure) -Terraform (for infrastructure as code) -Pipelines (for automation)
- We still need a way to package and run applications reliably. That’s where containers (like Docker) come in.

# Here’s why:
# Problem in Traditional IT	     -------------------------------------------     What Docker Solves

“Works on my machine” issues (dev vs prod environment differences)	            -Containers package code + dependencies into one 
                                                                                -image that runs anywhere the same way.
Heavy, slow VMs for every app	                                                -Containers are lightweight, share the same OS kernel,
                                                                                 start in seconds.
Scaling apps is hard	                                                        -Containers scale horizontally easily — run 1, 10, or
                                                                                 100 copies using orchestrators (Kubernetes, Azure 
                                                                                 Container Apps).
Moving apps between clouds or on-prem is complex	                            -Container images are portable — run on any cloud, 
                                                                                 local, or hybrid.
CI/CD requires fast test & deploy cycles	                                    -Containers build, test, and deploy in pipelines 
                                                                                 quickly and reproducibly.
- So even in Azure, Terraform, etc. — when you want to deploy an actual application (web, API, service) — the modern approach is:
- Build it into a Docker container.
- Push it to a container registry (like Azure Container Registry or Docker Hub).
- Deploy it onto compute platforms (Azure Kubernetes Service, Azure App Service, etc.).
💡 You can think of Terraform as building the playground (servers, networks), and Docker as the toys (apps) that actually run inside that playground.

## Overview
In this project, we learn the fundamentals of Docker by building a simple static web page inside a container.  
This helps us understand **containers**, **images**, and how they fit into modern cloud DevOps workflows.
---
## Why Docker?
Docker allows packaging an application with all its dependencies into a single **image**.  
This ensures that it runs the same way in development, staging, and production, regardless of the underlying infrastructure.

## 1. Write the Dockerfile
- Use the official Nginx image as a base
- Copy our static web page into Nginx's default folder
  COPY app/index.html /usr/share/nginx/html/index.html

## 2. Build the Docker Image
- cd ~/devops-labs/day10-docker-basics
- docker build -t my-nginx-demo .

## 3. Run the Container
- docker run -d -p 8080:80 my-docker-day10

## 4. Stop & Remove the Container (clean up)
- docker ps    # find the container ID
- docker stop <container_id>
- docker rm <container_id>

## ✅ Skills Learned
- Understanding containers vs. virtual machines
- Building and running a Docker image
- Using a base image (Nginx)
- Mapping local ports to container ports (-p 8080:80)
- Cleaning up containers

## Next Steps
- This foundation prepares us for:
- Multi-container setups (e.g., Docker Compose)
- Pushing images to Azure Container Registry (ACR)
- Deploying containers via Kubernetes (AKS)

### 📸 Screenshots
- Docker build
- Docker run
- Docker stop & show
- Docker remove
- Docker running mannualy
- fix WSL2 DNS permanently

###### 🔎 Notes
Here’s a short command sequence with descriptions to fix WSL2 DNS permanently:
1️⃣ Stop WSL completely (run in PowerShell/CMD)
   wsl --shutdown
2️⃣ Prevent automatic DNS generation
   sudo tee /etc/wsl.conf > /dev/null <<EOL
   [network]
   generateResolvConf = false
   EOL
3️⃣ Replace resolv.conf with Google DNS
   sudo tee /etc/resolv.conf > /dev/null <<EOL
   nameserver 8.8.8.8
   nameserver 8.8.4.4
   EOL
4️⃣ Restart WSL (run in PowerShell/CMD)
   wsl --shutdown
# Then reopen your Ubuntu terminal
5️⃣ Test DNS inside WSL
   ping -c 3 google.com
   curl https://registry-1.docker.io/v2/
✅ Once successful, Docker can build images
   docker build -t my-nginx-demo .
- wsl --shutdown → completely stops WSL2.
- /etc/wsl.conf → disables auto DNS generation.
- /etc/resolv.conf → sets a reliable public DNS (Google).
- ping & curl → verify DNS works.
- docker build → pull/build Docker images successfully.
- This sequence avoids manual editing and ensures DNS works every WSL2 session.
