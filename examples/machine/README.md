# Machine Example

This folder contains example Terraform code that provisions a virtual machine using the `machine` module.

## Quick Start

Initialized the module:

```
terraform init
```

Change `example.tfvars` variables to match your Proxmox URL and node.

Set `PM_USER` and `PM_PASS` environment variables with your Proxmox username and password.
Note the username *must* contain the realm, for example `root@pam`.

Apply the module:

```
terraform apply -var-file example.tfvars
```

Destroy the provisioned resources:

```
terraform destroy
```
