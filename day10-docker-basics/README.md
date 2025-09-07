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

