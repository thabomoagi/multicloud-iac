# Multi-Cloud Infrastructure Automation Lab & IDP Platform

A well-built infrastructure automation lab with production-style practices for multi-cloud infrastructure automation, Terraform modules, Ansible configuration management, secure CI/CD pipelines, and Internal Developer Platform (IDP) golden paths across **AWS** and **Azure**.

Built as a comprehensive reference implementation for Platform Engineering, Cloud Engineering, and Infrastructure Automation roles.

---

## Project Status & Roadmap

| Stage | Focus Area | Status | Key Deliverables |
| :--- | :--- | :--- | :--- |
| **Stage 0** | Foundation & Architecture | **[DONE]** | Multi-cloud directory structure, Terraform AWS VPC module, verification scripts, CI validation |
| **Stage 1** | Security & GitOps Pipelines | **[IN PROGRESS]** | OIDC authentication, `tflint`, `tfsec`/`checkov`, drift detection, remote state backend |
| **Stage 2** | Multi-Cloud Expansion (Azure) | **[IN PROGRESS]** | Azure VNet Terraform module and dev environment |
| **Stage 3** | Configuration Management (Ansible) | **[PLANNED]** | OS hardening, patching, idempotency playbooks for Windows/Linux estates |
| **Stage 4** | Infrastructure Marketplace / IDP | **[PLANNED]** | FastAPI self-service portal, catalog definitions, golden paths scaffolding |

---

## Architecture & Multi-Cloud Design

```
multicloud-iac/
├── .github/
│   └── workflows/
│       └── iac-pipeline.yml
├── docs/
│   └── screenshots/
├── scripts/
│   └── verify_deployment.py
├── terraform/
│   ├── environments/
│   │   ├── aws-dev/
│   │   └── azure-dev/
│   └── modules/
│       ├── aws-vpc/
│       └── azure-vnet/
├── ansible/
├── idp-portal/
├── tests/
│   └── test_verify_deployment.py
├── AGENTS.md
├── pytest.ini
├── requirements.txt
└── README.md
```

---

## Enterprise Engineering Standards

- **Automation-First**: Eliminating manual configuration drift through reusable IaC and CI/CD.
- **Secure by Design**: Least privilege IAM, policy-as-code, secrets management, and automated security linting (`tfsec`).
- **Quality Built-In**: Automated formatting (`terraform fmt`), linting (`tflint`), static analysis, and unit testing (`pytest` with `moto`).
- **Platform as a Product**: Designed for developer self-service via standardized Golden Paths and modular architecture.

---

## Repository Settings Recommendation

### Proposed Repository Description
> Multi-Cloud Infrastructure Automation Lab (AWS, Azure) featuring Terraform modules, Ansible config, GitHub Actions CI/CD, security scanning, policy-as-code, and IDP/Marketplace golden paths.

### Proposed Repository Topics
`terraform` `ansible` `aws` `azure` `infrastructure-as-code` `devops` `platform-engineering` `ci-cd` `github-actions` `finops` `idp`

---

## How to Deploy & Verify (Stage 0)

1. **Clone the Repository**
   ```bash
   git clone https://github.com/thabomoagi/multicloud-iac.git
   cd multicloud-iac/terraform/environments/aws-dev
   ```

2. **Initialize Terraform**
   ```bash
   terraform init
   ```

3. **Validate Configuration**
   ```bash
   terraform validate
   ```

4. **Review Execution Plan**
   ```bash
   terraform plan
   ```

5. **Verify Deployment Locally**
   ```bash
   python -m venv venv
   venv\Scripts\activate
   pip install -r requirements.txt
   python scripts/verify_deployment.py
   ```

6. **Run Tests**
   ```bash
   pytest
   ```

## CI/CD and AWS OIDC Setup

To enable automated Terraform execution and planning in GitHub Actions:

1. Configure an AWS IAM OIDC identity provider for GitHub (`token.actions.githubusercontent.com`).
2. Create an IAM role with permissions for Terraform deployment and establish a trust policy restricting access to this repository.
3. Add the resulting IAM Role ARN as a repository secret named `AWS_ROLE_ARN` under repository settings (Settings > Secrets and variables > Actions).
4. If `AWS_ROLE_ARN` is not set, linting, formatting, static security scans, and validation still execute successfully in CI, while Terraform plans run automatically once the secret is configured.
