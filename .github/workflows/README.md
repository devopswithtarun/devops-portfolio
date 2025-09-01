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
