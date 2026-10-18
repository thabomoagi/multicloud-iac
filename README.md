# AWS Infrastructure Automation and Starter Lab

Production-grade foundational infrastructure lab featuring Terraform modular architecture, GitHub Actions CI/CD pipelines with secure OIDC authentication, and automated validation. Designed as a clean, simple, and explainable starter showcase for cloud engineering and Terraform fundamentals.

## Project Architecture

```
multicloud-iac/
├── .github/
│   └── workflows/
│       └── iac-pipeline.yml
├── terraform/
│   ├── environments/
│   │   └── aws-dev/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── outputs.tf
│   └── modules/
│       └── aws-vpc/
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
├── INTERVIEW_NOTES.md
├── BROKE_AND_FIXED.md
└── README.md
```

## What is Built (AWS Free Tier)
- **VPC**: Isolated virtual private cloud with DNS support (`10.0.0.0/16`).
- **Subnets**: Public and private subnets across availability zones.
- **Internet Gateway & Route Tables**: Public internet access configuration for the public subnet.
- **VPC Flow Logs**: S3 bucket logging configured for network traffic auditing.

## Key Engineering Features
- **Remote State Management**: S3 backend with state locking.
- **GitHub OIDC Authentication**: Secure ephemeral IAM role assumption without hardcoded AWS credentials.
- **Automated Validation**: `terraform fmt`, `tflint`, `tfsec`, and `terraform validate` running in GitHub Actions.

## Getting Started

1. **Initialize Terraform**
   ```bash
   cd terraform/environments/aws-dev
   terraform init
   ```

2. **Validate Configuration**
   ```bash
   terraform validate
   ```

3. **Plan Execution**
   ```bash
   terraform plan
   ```
