## Day 7 — Introducing CI/CD with GitHub Actions

While waiting for Azure DevOps pipeline parallelism approval, we implemented a temporary CI/CD pipeline using **GitHub Actions** to continue learning.

### Steps Completed

1. **Created workflow directory** in repo:

2. **Added `ci.yml`** file with:
- Trigger on `push` and `pull_request` to `main`
- Ubuntu runner
- Terraform installation
- Terraform `init` and `validate` (safe, no `apply`)

3. **Pushed to GitHub** and confirmed workflow run under the **Actions** tab.

4. **Captured screenshots** for portfolio:
- VS Code showing `ci.yml`
- Actions tab showing the workflow run
- Success (green check) proof

### Why GitHub Actions?

- Same CI/CD principles as Azure DevOps pipelines.
- Free hosted runners available instantly.
- Keeps progress moving while Azure DevOps parallelism request is under review.

Once Azure DevOps parallelism is approved, we will replicate this workflow in Azure DevOps Pipelines.

### 🛠️ Steps (Day 8 — Improvements / Refinement)

- We improved the same file (ci.yml):
- Added terraform validate
- Kept plan automatic
- Made apply manual only (safety)

# Captured 🖼️ Screenshots:
- GitHub → Actions tab showing the workflow runs
- Logs showing:
   Terraform installation
   Init
   Validate
   Plan
   Azure

# 🧠 Key Learnings
- CI/CD is a concept, not a tool — we did everything in GitHub Actions, same could later be in Azure DevOps.
- Plan should always run automatically for feedback.
- Apply should be manual or gated for safety.
- Use .gitignore to avoid committing .terraform/ and state files.

# Create a service principal (using Azure CLI locally):
- az ad sp create-for-rbac \
  --name "github-terraform" \
  --role Contributor \
  --scopes /subscriptions/<your-subscription-id> \
  --sdk-auth

# SSH key process:
1. Check if you already have a key
- In your WSL/Ubuntu terminal:
- ls -l ~/.ssh
If you see files like id_rsa and id_rsa.pub, great — you already have a key pair.

2. If you have it, show the public key
- cat ~/.ssh/id_rsa.pub
You’ll see something like:
- ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3… rest of the key … lavith1777@TarunAnu
That entire line is your public key — copy it.

## Create Secret in GitHub:
- In GitHub → Settings → Secrets and variables → Actions.
- Name: TF_VAR_ssh_public_key
- Value: the entire public key line (starts with ssh-rsa).
- Pipeline picks it up automatically
- Terraform automatically uses environment variables that start with TF_VAR_ as input for variables of the same name (minus the TF_VAR_).
- No YAML changes required, but environment variables must be available to the job.

#### 🛠 If job still fails, manually pass env
Some workflows override env by default. To be 100% sure Terraform sees it, add an explicit env: block to your job in .github/workflows/ci.yml:
jobs:
  terraform:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: terraform-iac/day6-multi-vm
    env:
      TF_VAR_ssh_public_key: ${{ secrets.TF_VAR_ssh_public_key }}

That forces the runner to have the secret as an environment variable, which Terraform will use automatically.