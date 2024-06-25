# Terraform Module for Adding IP Restriction Rules to Azure Application Gateway

This Terraform module allows you to add IP restriction rules to an existing Azure Application Gateway. The module reads the existing Application Gateway configuration and appends the specified IP restriction rules.

## Prerequisites

- An existing Azure Application Gateway
- Terraform installed
- Azure CLI installed and authenticated

## Usage

### 1. Clone the Repository

Clone the repository containing the Terraform module.

```bash
git clone https://github.com/NashTech-Labs/Terraform-module-IP-whitelist-AppGW.git
cd Terraform-module-IP-whitelist-AppGW
```

### 2. Configure Variables
Create a terraform.tfvars file with the required variables.

### 3. Apply the Configuration
Apply the Terraform configuration to update the Application Gateway with the specified IP restriction rules.

```bash
terraform init
terraform plan
terraform apply
```


