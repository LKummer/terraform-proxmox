# Terraform Proxmox Module

## Running Tests

Set `PM_USER` and `PM_PASS` environment variables with your Proxmox username and password.
Note the username *must* contain the realm, for example `root@pam`.
It is recommended to use `.env` files.

To run tests:

```
cd test
go test .
```

Note it takes a while as it provisions real resources.
