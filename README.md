# Terraform Proxmox Module

Terraform modules for working with Proxmox.

Currently contains the `machine` module and an example of it.
Provisioning a virtual machine in Proxmox with autogenerated user name and password.

**IMPORTANT** this repository is push mirrored from my private GitLab.
Changes on the mirror will be discarded.

## Usage

See the `examples` folder for full examples.

See variable descriptions for more information on specific variables.

Note you must have a Proxmox template with Cloud Init to use the `machine` module.

## Development

### Running Tests

Set `PM_API_TOKEN_ID` and `PM_API_TOKEN_SECRET` environment variables with your Proxmox token ID and secret token.
Note the token ID *must* contain the username and realm, for example `root@pam!token`.

To run tests:

```
cd test
go test .
```

Note it takes a while as it provisions real resources.

### Managing Credentials

[See Proxmox Terraform provider documentation](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs#creating-the-proxmox-user-and-role-for-terraform) on creating a role with privileges for Terraform.

It is recommended to use a `.env` file to manage credentials.
For example:

```bash
# Inside .env
export PM_API_TOKEN_ID='user@pve!token'
export PM_API_TOKEN_SECRET='xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
```

### Linting

The repository is linted in CI.
Make sure to lint before pushing.

```
tflint --module modules/machine
tflint examples/machine
```

### Formatting

Formatting is checked in CI.
Make sure to format code before pushing.

```
terraform fmt -recursive .
```

### Linting the Tests

The tests are linted in CI.
Make sure to lint before pushing.

```
cd test
golangci-lint run
```

### Formatting the Tests

Test formatting is checked in CI.
Make sure to format the tests before pushing.

```
cd test
gofmt -w .
```

## Contribution

This module is built for my own needs and is not made for public consumption.
It likely will not suit your needs perfectly.

Please learn from it and make your own modules instead of modifying it to fit your needs.

This repository is mirroring a private repository, changes to the mirror will be overridden.
