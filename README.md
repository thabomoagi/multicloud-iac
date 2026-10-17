# Multicloud Infrastructure Automation and Platform Engineering Lab

Production-grade infrastructure automation lab featuring Terraform modular architectures, GitHub Actions CI/CD pipelines with OIDC authentication, policy-as-code, and developer self-service golden paths across AWS (deployed) and Azure (validated).

Clone URL: https://github.com/thabomoagi/multicloud-iac.git

Built as a comprehensive reference implementation for Platform Engineering, Cloud Engineering, and Infrastructure Automation roles.

---

## Project Status & Roadmap

| Stage | Focus Area | Status | Key Deliverables |
| :--- | :--- | :--- | :--- |
| **Stage 0** | Foundation & Architecture | **[DONE]** | Multi-cloud directory structure, Terraform AWS VPC module (Deployed), verification scripts, CI validation |
| **Stage 1** | Security & GitOps Pipelines | **[DONE]** | OIDC authentication, `tflint`, `tfsec`, drift detection, remote state backend |
| **Stage 2** | Multi-Cloud Expansion (Azure) | **[DONE]** | Azure VNet & VM Terraform modules and dev environment |
| **Stage 3** | Configuration Management (Ansible) | **[DONE]** | OS hardening roles, inventory, and site playbooks |
| **Stage 4** | Infrastructure Marketplace / IDP | **[DONE]** | FastAPI self-service portal, catalog definitions, and provision endpoints |

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
│       ├── azure-vnet/
│       └── azure-vm/
├── ansible/
│   ├── ansible.cfg
│   ├── inventory/
│   ├── playbooks/
│   └── roles/
├── idp-portal/
│   ├── requirements.txt
│   └── app/
│       ├── main.py
│       └── catalog.json
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

### Repository Description
Multi-Cloud Infrastructure Automation Lab (AWS deployed, Azure validated) featuring Terraform modules, Ansible config, GitHub Actions CI/CD, security scanning, policy-as-code, and IDP/Marketplace golden paths.

### Repository Topics
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

1. Configure AWS IAM OIDC provider for GitHub Actions (`token.actions.githubusercontent.com`).
2. Create an IAM role restricting assume-role trust policy to this GitHub repository.
3. Configure the `AWS_ROLE_ARN` secret in GitHub repository settings under Actions secrets.
4. OIDC authentication issues short-lived session tokens during CI runs, eliminating long-lived AWS static credentials.

## AI Assistant Usage and Approval Governance

1. AI assistants are utilized strictly under human-in-the-loop governance.
2. All file modifications, pipeline changes, and infrastructure code generation require explicit human review and approval before execution or commit.
3. Automated pre-flight checks and tests must pass prior to merging any changes into the main branch.
