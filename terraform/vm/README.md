# <center> Infrastructure as Code (IaC) via Terraform </center>
---

[source](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform)

---

#### Files
- [providers.tf](providers.tf)
- [main.tf](main.tf)
- [variables.tf](variables.tf)

---

## Commands

#### Initialize Terraform

Run [terraform init](https://www.terraform.io/docs/commands/init.html) to initialize the Terraform deployment. This command downloads the Azure modules required to manage your Azure resources.
```shw
terraform init
```

#### Create a Terraform execution plan
Run [terraform plan](https://www.terraform.io/docs/commands/plan.html) to create an execution plan.
```sh
terraform plan -out main.tfplan
```

#### Apply a Terraform execution plan
Run [terraform apply](https://www.terraform.io/docs/commands/apply.html) to apply the execution plan to your cloud infrastructure.
```sh
terraform apply main.tfplan
```

#### Verify the results
To use SSH to connect to the virtual machine, do the following steps:
1. Run [terraform output](https://www.terraform.io/cli/commands/output) to get the SSH private key and save it to a file.
```sh
terraform output -raw tls_private_key > ~/.ssh/az_id_rsa
```
2. Run [terraform output](https://www.terraform.io/cli/commands/output) to get the virtual machine public IP address.
```sh
terraform output public_ip_address
```
3. ...


---
---
---
