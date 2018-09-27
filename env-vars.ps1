### Authentication details
$env:TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaa33v7nazcbtihlsqej3tfnmoejalaw2jqh372f62ad2w7i3g7yk5q"
$env:TF_VAR_user_ocid="ocid1.user.oc1..aaaaaaaat4bbthifpovo3w4dclqtrjngxj2ucuve6kwtnntg6z7v2k7am6oa"
$env:TF_VAR_fingerprint="4f:90:09:d7:2a:ea:81:a8:76:97:2a:51:9c:e9:36:03"
$env:TF_VAR_private_key_path=".\SshKeys\APIKeys\bmcs_api_key.pem"

### Compartment
$env:TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaach4c3i5kpecjfjqwp3wfjfmbbjniyzieaxhcjs6c73ya2wl6vaxq"

### Region
$env:TF_VAR_region="us-ashburn-1"

### Public/private keys used on the instances
$env:TF_VAR_ssh_public_key = Get-Content .\SshKeys\IaaSkeys\id_rsa.pub -Raw
$env:TF_VAR_ssh_private_key = Get-Content .\SshKeys\IaaSkeys\id_rsa -Raw



