# 🚀 Azure 3-Tier Architecture using Terraform

A production-grade Infrastructure-as-Code (IaC) project that deploys a secure, scalable, and modular **3-tier architecture on Microsoft Azure** using Terraform.

---

## 📌 Overview

This project demonstrates how to design and deploy a **secure cloud-native architecture** following best practices:

* **Web Tier (Frontend)** – Public-facing layer behind Load Balancer
* **App Tier (Backend)** – Internal business logic layer
* **DB Tier (Database)** – Managed Azure SQL Database

---

## 🏗️ Architecture

```
                Internet
                    │
        ┌─────────────────────────┐
        │  Load Balancer / App GW │
        └────────────┬────────────┘
                     │
              ┌────────────┐
              │  Web Tier  │  (Public Subnet)
              └─────┬──────┘
                    │
              ┌────────────┐
              │  App Tier  │  (Private Subnet)
              └─────┬──────┘
                    │
              ┌────────────┐
              │  DB Tier   │  (Private / PaaS)
              └────────────┘
```

---

## ✨ Features

* ✅ Modular Terraform structure
* ✅ Remote backend (Azure Storage)
* ✅ Network segmentation using VNet + Subnets
* ✅ Network Security Groups (NSGs) for strict traffic control
* ✅ Azure Bastion (secure VM access, no public SSH)
* ✅ Azure Load Balancer for web tier
* ✅ Azure SQL Database (managed DB)
* ✅ Azure Key Vault for secret management
* ✅ CI/CD pipeline using GitHub Actions
* ✅ Environment-based deployment (dev/prod)
* ✅ No hardcoded values (fully parameterized)

---

## 📁 Project Structure

```
azure-3tier-terraform/
│
├── backend.tf
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
│
├── modules/
│   ├── vnet/
│   ├── nsg/
│   ├── web/
│   ├── app/
│   ├── db/
│   ├── bastion/
│   └── keyvault/
│
├── .github/workflows/
│   └── terraform.yml
│
└── README.md
```

---

## ⚙️ Prerequisites

* Terraform >= 1.5
* Azure CLI
* Azure Subscription
* GitHub Account

---

## 🔐 Authentication (IMPORTANT)

This project uses **Service Principal authentication** instead of manual `az login`.

### Create Service Principal

```bash
az ad sp create-for-rbac --name "terraform-sp" \
  --role Contributor \
  --scopes /subscriptions/<SUBSCRIPTION_ID> \
  --sdk-auth
```

---

## 🔑 GitHub Secrets

Add the following secret in your repository:

| Secret Name       | Description                   |
| ----------------- | ----------------------------- |
| AZURE_CREDENTIALS | Service Principal JSON output |

---

## 🚀 Usage

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/azure-3tier-terraform.git
cd azure-3tier-terraform
```

---

### 2. Initialize Terraform

```bash
terraform init
```

---

### 3. Plan Deployment

```bash
terraform plan -var-file="terraform.tfvars"
```

---

### 4. Apply Infrastructure

```bash
terraform apply -auto-approve -var-file="terraform.tfvars"
```

---

## 🌍 Environment-Based Deployment

You can deploy different environments using separate tfvars files:

```bash
terraform apply -var-file="terraform.tfvars.dev"
terraform apply -var-file="terraform.tfvars.prod"
```

---

## 🔒 Security Best Practices

* No hardcoded credentials
* Secrets stored in Azure Key Vault
* Private subnets for App & DB tiers
* NSG rules restrict inter-tier communication
* Bastion used instead of public SSH
* Remote state storage with locking

---

## 🔄 CI/CD Pipeline

GitHub Actions workflow automates:

* Terraform Init
* Terraform Plan
* Terraform Apply

Triggered on push to `main` branch.

---

## 📊 Future Enhancements

* VM Scale Sets (Auto Scaling)
* Application Gateway (Layer 7 Routing)
* Private Endpoints for DB
* Monitoring with Azure Monitor & Log Analytics
* Blue-Green Deployment

---

## 🧠 Learning Outcomes

* Infrastructure as Code (Terraform)
* Azure Networking & Security
* CI/CD Automation
* Production-grade cloud architecture design

---

## 👨‍💻 Author

**Mukul**
DevOps Engineer | Terraform | Azure | CI/CD

---

## ⭐ Contribute

Feel free to fork, improve, and raise PRs!

---

## 📜 License

This project is licensed under the MIT License.
