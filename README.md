# drone-gcs-telemetry-terraform
Infra Creation for drone gcs platform via terraform

# Infrastructure-as-Code: Azure VM with Monitoring Stack

This project provisions an Azure VM with Docker, and deploys the following via Docker Compose:
- Telemetry API service (Node.js)
- MongoDB (as DB backend)
- Prometheus (for metrics collection)
- Grafana (for visualization)

## Project Structure
- `main.tf` - Terraform code for VM, NSG, Key Vault, networking, etc.
- `cloud-init.yaml` - Bootstraps the VM to install Docker and launch services.
- `.github/workflows/deploy.yml` - GitHub Actions CI/CD pipeline.
- `.env` - Environment file for secrets (should not be checked in to Git).
- `prometheus.yml` - Prometheus configuration.

## Deployment Steps

### 1. Setup GitHub Secrets
Create the following GitHub secrets in your repository:
- `ARM_CLIENT_ID`
- `ARM_CLIENT_SECRET`
- `ARM_SUBSCRIPTION_ID`
- `ARM_TENANT_ID`

These are required by Terraform to authenticate to Azure.

### 2. Cloud Init Script
The cloud-init script will install Docker, Docker Compose, and deploy the full monitoring stack automatically when the VM boots.

### 3. Trigger Deployment
Push to the `main` branch to trigger the CI/CD pipeline via GitHub Actions.

### 4. Access Services
After deployment, you can access:
- Grafana: `http://<VM_PUBLIC_IP>:3000`
- Prometheus: `http://<VM_PUBLIC_IP>:9090`
- Telemetry API: `http://<VM_PUBLIC_IP>:3001`

Login to Azure portal to get the VM public IP or check GitHub Actions output.


##5 ARchitecture Diagram

<img width="585" height="1544" alt="image" src="https://github.com/user-attachments/assets/218762a6-96c0-4d43-a549-5e434e8bdda1" />
