### Authentication details
$env:TF_VAR_tenancy_ocid="ocid1.tenancy.oc1.xxxxx"
$env:TF_VAR_user_ocid="ocid1.user.oc1.xxxxx"
$env:TF_VAR_fingerprint="4f:90:09:d7:2a:ea:81:a8:76:97:xxxxx"
$env:TF_VAR_private_key_path=".\SshKeys\APIKeys\bmcs_api_key.pem"

### Compartment
$env:TF_VAR_compartment_ocid="ocid1.compartment.oc1.xxxxx"

### Region
$env:TF_VAR_region="us-ashburn-1"

### Public/private keys used on the instances
$env:TF_VAR_ssh_public_key = Get-Content .\SshKeys\IaaSkeys\id_rsa.pub -Raw
$env:TF_VAR_ssh_private_key = Get-Content .\SshKeys\IaaSkeys\id_rsa -Raw



