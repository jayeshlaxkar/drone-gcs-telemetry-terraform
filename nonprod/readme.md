```markdown
# Azure VM with Cloud-Init & Key Vault Deployment via Terraform

## 🔧 Prerequisites
- Terraform installed
- Azure SPN credentials loaded as environment variables
- VM Admin Password stored in Azure Key Vault

## 🧪 Steps
```bash
terraform init
terraform plan
terraform apply
```

## 🔐 Secure Admin Password
Stored in Azure Key Vault, retrieved using:
```hcl
admin_password = data.azurerm_key_vault_secret.admin_password.value
```

## 📦 Cloud-Init
Provision VM to run telemetry app with:
- Docker
- Docker Compose
- Prometheus
- Grafana
