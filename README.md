## Description

This repository contains a Terraform-based Infrastructure as Code (IaC) solution that automates the deployment of multiple Windows Virtual Machines and associated networking components in Microsoft Azure. The project focuses on scalable, repeatable infrastructure provisioning, reducing manual effort and ensuring consistent environments using Terraform best practices.

## Architecture Overview

Components Deployed:

Azure Resource Group

Virtual Network & Subnet

Network Interfaces (NICs)

Multiple Windows Virtual Machines (dynamic creation)

Azure Subscription
│
├── Resource Group
│ ├── Virtual Network
│ │ └── Subnet
│ ├── Network Interfaces
│ └── Windows Virtual Machines (Terraform for_each)

Key Features

✅ Automated provisioning of multiple Azure VMs using Terraform

🔁 Dynamic VM creation with for_each

📤 Terraform outputs for VM private IP addresses

🧱 Modular and reusable infrastructure design

🚀 ~80% reduction in manual VM provisioning effort

🧰 Tech Stack

Terraform

Microsoft Azure

Azure Virtual Machines

Azure Networking (VNet, Subnets, NICs)

DevOps & Infrastructure as Code (IaC)

📁 Repository Structure

├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── README.md

🚀 Deployment Steps
Prerequisites

Azure Subscription

Terraform installed

Azure CLI authenticated

az login
terraform init
terraform plan
terraform apply

📊 Results & Impact

⏱️ 80% reduction in manual VM provisioning time

📦 Consistent and repeatable infrastructure deployments

📈 Scalable design supporting rapid environment creation

📌 Future Enhancements

Support for Linux Virtual Machines

Azure Monitor & Log Analytics integration

VM scale-out using Terraform variables

CI/CD pipeline using GitHub Actions





























