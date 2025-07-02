# 🌐 Azure Static Website Deployment using Terraform

This project provisions a **Static Website on Azure** using **Terraform**, with optional automation via **GitHub Actions CI/CD**.

---

## 🚀 Features

- ✅ Azure Storage Account + Resource Group provisioning
- ✅ Static website hosting enabled
- ✅ Output URL after deployment
- ✅ Optional GitHub Actions CI/CD pipeline

---

## 🛠️ Tools Used

- **Terraform** for Infrastructure as Code (IaC)
- **Azure CLI** for authentication and blob upload
- **GitHub Actions** (optional) for CI/CD automation

---

## 📦 Prerequisites

- Azure Subscription
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Git & GitHub

---

## 🧪 Manual Deployment Steps

1. **Login to Azure**
   ```bash
   az login


2. Initialize Terraform
terraform init


3. Plan & Apply
terraform plan -out=tfplan
terraform apply tfplan

4. Upload your HTML site

az storage blob upload-batch \
  --account-name <generated_account_name> \
  --destination \$web \
  --source ./site \
  --auth-mode login

5.Access the Website
Terraform will output the website URL.

✅ Future Enhancements
Add HTML upload automation in Terraform

Connect a custom domain via Azure CDN

Enable HTTPS

🧠 Author
Built for hands-on learning and cloud portfolio development by Haidi Zakaria
