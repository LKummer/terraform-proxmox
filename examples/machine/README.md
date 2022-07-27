# Machine Example

This folder contains example Terraform code that provisions a virtual machine using the `machine` module.

## Quick Start

Initialized the module:

```
terraform init
```

Change `terraform.tfvars` variables to match your Proxmox URL and node.

Set `PM_API_TOKEN_ID` and `PM_API_TOKEN_SECRET` environment variables with your Proxmox token ID and secret token.
Note the token ID *must* contain the username and realm, for example `root@pam!token`.

Apply the module:

```
terraform apply
```

Destroy the provisioned resources:

```
terraform destroy
```

## Managing Credentials

[See Proxmox Terraform provider documentation](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs#creating-the-proxmox-user-and-role-for-terraform) on creating a role with privileges for Terraform.

It is recommended to use a `.env` file to manage credentials.
For example:

```bash
# Inside .env
export PM_API_TOKEN_ID='user@pve!token'
export PM_API_TOKEN_SECRET='xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
```
