    #     ___  ____     _    ____ _     _____
    #    / _ \|  _ \   / \  / ___| |   | ____|
    #   | | | | |_) | / _ \| |   | |   |  _|
    #   | |_| |  _ < / ___ | |___| |___| |___
    #    \___/|_| \_/_/   \_\____|_____|_____|
***
## Manage an instance
This example launches a Database System into an existing subnet and because it's an anti-pattern to launch an DBSystem in a subnet with Internet access, behind an existing bastion host. Database Systems don't support user-data scripts but there are still use cases where you might want to execute a script once the DBNode starts so we use the `file` and `remote-exec` provisoners to get through the bastion host and onto the instance. The configuration outputs the private IP address of the instance.

### Using this example
* Update env-vars with the required information. Most examples use the same set of environment variables so you only need to do this once.
* Source env-vars -
  * `$ . env-vars`
* Update `variables.tf` with your launch options and bastion host IP.  

### Files in the configuration

#### `env-vars`
Is used to export the environmental variables used in the configuration. These are usually authentication related, be sure to exclude this file from your version control system. It's typical to keep this file outside of the configuration.

Before you plan, apply, or destroy the configuration source the file -  
`$ . env-vars`

#### `DBSystem.tf`
Defines the Database System

#### `remote-exec.tf`
Uses a `null_resource`, `file`, `remote-exec` and `depends_on` to execute a script on the instance. [More information on the remote-exec provisioner.](https://www.terraform.io/docs/provisioners/remote-exec.html)  

#### `./scripts/bootstrap.sh`
A script that gets scp'ed onto the instance then executed.  

#### `variables.tf`
Defines the variables used in the configuration

#### `datasources.tf`
Defines the datasources used in the configuration

#### `outputs.tf`
Defines the outputs of the configuration

#### `provider.tf`
Specifies and passes authentication details to the OCI TF provider

### check OCI setup
oci iam region list --query='data[].{name:name}' --output table

+----------------+
| name           |
+----------------+
| eu-frankfurt-1 |
| us-ashburn-1   |
| uk-london-1    |
| us-phoenix-1   |
+----------------+

### create a compartment
oci iam compartment create --compartment-id="ocid1.tenancy.oc1..aaaaaaaa33v7nazcbtihlsqej3tfnmoejalaw2jqh372f62ad2w7i3g7yk5q" --name="DevCP" --description="Compartiment de C.Pruvost" --wait-for-state=ACTIVE --max-wait-seconds=300 --wait-interval-seconds 5

### check the compartment
oci iam compartment list --compartment-id="ocid1.tenancy.oc1..aaaaaaaa33v7nazcbtihlsqej3tfnmoejalaw2jqh372f62ad2w7i3g7yk5q" --all --query='data[?name == `DevCP`].{compartment:"id"}' --output=json |  jq -r '.[].compartment'

### create a Bucket 
oci os bucket create --compartment-id="ocid1.compartment.oc1..aaaaaaaach4c3i5kpecjfjqwp3wfjfmbbjniyzieaxhcjs6c73ya2wl6vaxq" --public-access-type NoPublicAccess --name MyBucketForTerraform

### send terraform state to Oracle object storage
oci os object put --bucket-name=MyBucketForTerraform --file=terraform.tfstate --name=/terraform/my-bucket/terraform.tfstate

### create preauth request
oci os preauth-request create --bucket-name=MyBucketForTerraform  --name=terraform-preauth-request --object-name=/terraform/my-bucket/terraform.tfstate --access-type=ObjectReadWrite --time-expires 2020-12-31T23:59Z --query='data.{uri:"access-uri"}' --output=json | jq -r '.uri'