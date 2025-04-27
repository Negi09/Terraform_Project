---

# 🚀 Terraform AWS S3 Static Website Project

This project uses **Terraform** to create an AWS **S3 bucket** for static website hosting, with **remote backend** management for the Terraform state using S3 and DynamoDB.

---

## 📂 Project Files

- `main.tf` - Main infrastructure resources
- `provider.tf` - AWS provider and backend configuration
- `variable.tf` - Input variables
- `output.tf` - Output values

---

## 🌟 What It Does

- Creates a versioned **S3 bucket** for website hosting
- Configures **bucket policies** for public access (if needed)
- Stores Terraform **state file remotely** in S3
- Locks state with **DynamoDB** for safe collaboration
- Clean separation of logic using Terraform best practices

---

## 🛠 Prerequisites

- Terraform >= 1.0 installed
- AWS CLI configured
- Permissions to create:
  - S3 Buckets
  - DynamoDB Tables

---

## ⚙️ Quick Start

```bash
# Clone this repository
git clone https://github.com/YourUsername/Terraform_Project-.git
cd Terraform_Project-

# Initialize Terraform
terraform init

# Review the execution plan
terraform plan

# Apply the changes
terraform apply
```

---

## 🔒 Backend Details

| Component         | Configured As                    |
|-------------------|------------------------------------|
| S3 Backend Bucket | `var.bucketname`                  |
| State File Key    | `terraform/state/terraform.tfstate` |
| Region            | `us-east-1`                      |
| Lock Table        | `terraform-state-lock`            |

---

## 🚨 Important

- Make sure your **state bucket** and **DynamoDB table** exist **before** running `terraform init`.
- `.terraform/`, `.tfstate`, `.tfvars`, and other sensitive files are **ignored** in `.gitignore`.
- **Never** hardcode sensitive credentials directly in the code.

---


---


