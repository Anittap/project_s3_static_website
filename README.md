# Static Website Deployment with Terraform and GitHub Actions

This project demonstrates the deployment of a static website using **Terraform** for infrastructure management and **GitHub Actions** for CI/CD automation.

## Project Structure

```
.
├── terraform/                  # Terraform configuration files
├── .github/workflows/          # GitHub Actions workflows
├── website/                    # Static website files
```

## Features

- Automated infrastructure provisioning using Terraform
- Static website hosting on AWS S3
- DNS management with Route53
- Secure and automated deployments via GitHub Actions
- Dynamic handling of MIME types for website files
- Workflow for manual resource destruction

## Prerequisites

- AWS account with IAM user and appropriate permissions
- GitHub repository with Secrets configured:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_DEFAULT_REGION`
- Terraform installed locally for development
- s3 bucket to store terraform.tfstate file which is declared in terraform.tf

## Setup Steps

### 1. Infrastructure Provisioning

Terraform is used to create and configure the following:

1. **S3 Bucket**: For hosting the static website.
2. **Route53**: To manage DNS and point to the S3 bucket.
3. **IAM Policies**: To manage access to resources.

### 2. GitHub Actions Workflows

- **Deployment Workflow**: Automatically triggered on push to the `master` branch.
  - Initializes and applies Terraform configurations.
  - Uploads website files to S3.

- **Resource Destruction Workflow**: Manually triggered using `workflow_dispatch` with input confirmation.
  - Destroys all Terraform-managed resources.

## Key Files

### `terraform/main.tf`
Defines the S3 bucket, Route53 DNS configuration, and IAM policies.

### `.github/workflows/terraform-create.yml`
Automates the deployment process with Terraform commands:

- `terraform init`
- `terraform validate`
- `terraform plan`
- `terraform apply`

### `.github/workflows/terraform-destroy.yml`
Handles manual destruction of resources via Terraform.

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/Anittap/project_s3_static_website.git
   ```

2. Navigate to the `terraform/` directory and initialize Terraform:
   ```bash
   cd terraform
   terraform init
   ```

3. Deploy the infrastructure:
   ```bash
   terraform apply
   ```

4. Push changes to the `master` branch to trigger the deployment workflow.

5. (Optional) Manually trigger the destruction workflow via GitHub Actions if needed.

## Takeaways

- Automated and repeatable infrastructure setup with Terraform.
- Streamlined deployments using GitHub Actions.
- Secure handling of secrets and credentials.

