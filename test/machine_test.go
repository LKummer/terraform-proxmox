package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/ssh"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestMachineExample(t *testing.T) {
	sshKeyPair := generateED25519KeyPair(t)

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/machine",
		Vars: map[string]interface{}{
			"cloud_init_public_keys": sshKeyPair.PublicKey,
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApplyAndIdempotent(t, terraformOptions)

	sshIP := terraform.Output(t, terraformOptions, "ssh_ip")
	sshUser := terraform.Output(t, terraformOptions, "ssh_user")
	ssh.CheckSshConnection(t, ssh.Host{
		Hostname:    sshIP,
		SshUserName: sshUser,
		SshKeyPair:  sshKeyPair,
		CustomPort:  22,
	})
}
