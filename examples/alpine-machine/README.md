# Alpine Machine Example

This folder contains example Terraform code that provisions an Alpine Linux
virtual machine using the `machine` module.

## Quick Start

Initialized the module:

```
terraform init
```

Change `terraform.tfvars` variables to match your Proxmox URL and node.

Set `PM_API_TOKEN_ID` and `PM_API_TOKEN_SECRET` environment variables with your
Proxmox token ID and secret token.
Note the token ID _must_ contain the username and realm, for example
`root@pam!token`.

Apply the module:

```
terraform apply
```

Destroy the provisioned resources:

```
terraform destroy
```

## Managing Credentials

[See how-to guide on creating Proxmox role with privileges for Terraform.](https://lkummer.github.io/homelab-wiki/how-to/proxmox-api-tokens/#creating-role-for-automation)

Set `PROXMOX_VE_API_TOKEN` environment variable with a value of the form
`user@realm!token=secret`.
It is recommended to use a `.env` file to manage credentials.
For example:

```bash
# Inside .env
export PROXMOX_VE_API_TOKEN='user@pve!token=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
```
