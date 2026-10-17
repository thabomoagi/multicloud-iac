# AGENTS & COPILOT RULES

- [INTERVIEW]: Be ready to explain architecture, least privilege, IaC modularity, state management, security scanning, policy-as-code, drift detection, and FinOps in interviews.
- [JOB-REQ]: Map infrastructure automation to enterprise requirements (Terraform, Ansible, CI/CD, AWS/Azure/Hetzner, secrets handling, GitOps, IDP/marketplace patterns).
- [SECURITY]: Embed least privilege, secret management, security scanning (tfsec/tflint), and compliance by design. Never commit secrets or state files.
- [COST]: Track cloud costs, tag resources, use budget alerts, and clean up test resources promptly.
- [COMMON MISTAKE]: Watch out for wrong CIDRs, committed state files, open security groups (`0.0.0.0/0`), forgotten destroys, hardcoded secrets, renaming modules without care, and locking out via SSH/firewall.
- [PRE-FLIGHT]: Before any command creating/changing/deleting cloud resources, server configs, or files outside the repo, state: 1) what it does, 2) what could go wrong, 3) how to undo it, 4) whether it costs money. Wait for approval.
- [NO MOCKS]: No stubs or placeholder modules unless explicitly noted. Fully testable code.
- [STYLE]: Never use emojis or code comments. Keep all code and documentation free of emojis and explanatory comments; only functional directives (e.g., `#tfsec:ignore:...`) are allowed.
- [WORKFLOW]: One stage at a time, explain blocks, run fmt/validate/lint/scan/tests, show output.
