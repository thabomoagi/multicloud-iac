# Multi-Cloud Infrastructure Automation Lab & IDP Platform

Production-grade multi-cloud infrastructure automation, Terraform modules, Ansible configuration management, secure CI/CD pipelines, and Internal Developer Platform (IDP) golden paths across **AWS**, **Azure**, and **Hetzner (on-premise / bare-metal emulation)**.

Built as a comprehensive reference implementation for Platform Engineering, Cloud Engineering, and Infrastructure Automation roles.

---

## 🚀 Project Status & Roadmap

| Stage | Focus Area | Status | Key Deliverables |
| :--- | :--- | :--- | :--- |
| **Stage 0** | Foundation & Architecture | **[DONE]** | Multi-cloud directory structure, Terraform AWS VPC module, verification scripts, CI validation |
| **Stage 1** | Security & GitOps Pipelines | **[IN PROGRESS]** | OIDC authentication, `tflint`, `tfsec`/`checkov`, drift detection, remote state backend |
| **Stage 2** | Multi-Cloud Expansion (Azure & Hetzner) | **[PLANNED]** | Azure VNet & VM Terraform modules, Hetzner cloud server automation |
| **Stage 3** | Configuration Management (Ansible) | **[PLANNED]** | OS hardening, patching, idempotency playbooks for Windows/Linux estates |
| **Stage 4** | Infrastructure Marketplace / IDP | **[PLANNED]** | FastAPI self-service portal, catalog definitions, golden paths scaffolding |

---

## 🏗️ Architecture & Multi-Cloud Design

```
multicloud-iac/
├── .github/
│   └── workflows/
│       └── iac-pipeline.yml        # CI pipeline (lint, validate, security scan, plan)
├── docs/
│   └── screenshots/                # Deployment proof & architecture diagrams
├── scripts/
│   └── verify_deployment.py        # Post-deployment boto3 verification script
├── terraform/
│   ├── environments/
│   │   └── aws-dev/                # Dev environment config (calls aws-vpc module)
│   └── modules/
│       ├── aws-vpc/                # Reusable AWS VPC module (Public/Private subnets, IGW)
│       ├── azure-vnet/             # (Planned) Azure Virtual Network module
│       └── hetzner-server/         # (Planned) Hetzner compute & network module
├── ansible/                        # (Planned) Configuration management & OS hardening
├── idp-portal/                     # (Planned) Internal Developer Platform API & UI
├── tests/
│   └── test_verify_deployment.py   # moto-mocked tests for verification script
├── AGENTS.md                       # Engineering guidelines & rules
├── pytest.ini
├── requirements.txt
└── README.md
```

---

## 🛡️ Enterprise Engineering Standards

- **Automation-First**: Eliminating manual configuration drift through reusable IaC and CI/CD.
- **Secure by Design**: Least privilege IAM, policy-as-code, secrets management, and automated security linting (`tfsec`).
- **Quality Built-In**: Automated formatting (`terraform fmt`), linting (`tflint`), static analysis, and unit testing (`pytest` with `moto`).
- **Platform as a Product**: Designed for developer self-service via standardized Golden Paths and modular architecture.

---

## 📋 Repository Settings Recommendation

### Proposed Repository Description
> Multi-Cloud Infrastructure Automation Lab (AWS, Azure, Hetzner) featuring Terraform modules, Ansible config, GitHub Actions CI/CD, security scanning, policy-as-code, and IDP/Marketplace golden paths.

### Proposed Repository Topics
`terraform` `ansible` `aws` `azure` `hetzner` `infrastructure-as-code` `devops` `platform-engineering` `ci-cd` `github-actions` `finops` `idp`

---

## 🚦 How to Deploy & Verify (Stage 0)

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
   ```python
   python -m venv venv
   venv\Scripts\activate
   pip install -r requirements.txt
   pytest
   ```
