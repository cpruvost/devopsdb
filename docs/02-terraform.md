# Configuration of terraform

This example launches a Database System into an existing subnet with Internet access and a rule to open port 1521. Sure it's an anti-pattern and in real life we will run this Database on a private Subnet with no Internet access but the goal is to do the most simplest tuto.

In your DevOpsDbVM clone the DevOpsDb repository on github : `git clone https://github.com/cpruvost/devopsdb.git`

In order to access OCI Db VM with SSH you must download SSH Keys :  [Ssh Public Key](https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/DevOpsDbBucket/o/id_rsa.pub), [Ssh Private Key](https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/DevOpsDbBucket/o/id_rsa), [Ssh Putty Key](https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/DevOpsDbBucket/o/id_rsa.ppk).

Now look at all the tf files. Take time to understand the purpose of each file.

## Files in the configuration

#### `env-vars`

Is used to export the environmental variables used in the configuration. These are usually authentication related, be sure to exclude this file from your version control system. It's typical to keep this file outside of the configuration.

The first step before doing terraform plan, apply, or destroy is always to do a : source ./env-vars

#### `DBSystem.tf`

Defines the Database System

#### `variables.tf`

Defines the variables used in the configuration

#### `datasources.tf`

Defines the datasources used in the configuration

#### `outputs.tf`

Defines the outputs of the configuration

#### `provider.tf`

Specifies and passes authentication details to the OCI TF provider

#### `backend.tf`

Specifies the remote location of the terraform state files.  

#### `vcn.tf`

Specifies the Virtual Cloud network and the subnets that will be used by the Db VM.

## Update  env-vars

After updating with the good values from your OCI Account, do a `chmod +x ./env-vars` and then  `source ./env-vars`

Update the location of the SSH Keys in order to take them in the project's directory.

export TF_VAR_private_key_path="./SshKeys/APIKeys/bmcs_api_key.pem"

export TF_VAR_ssh_public_key=$(cat ./SshKeys/IaaSkeys/id_rsa.pub)

export TF_VAR_ssh_private_key=$(cat ./SshKeys/IaaSkeys/id_rsa)

## Initialize terraform

First Rename the backend.tf file into backend.old file because we did not create the remote location of terraform state file before. 

In the devopsdb directory do a `terraform init`. Terraform will get the OCI Provider that is declared in provider.tf

```shell
* provider.oci: version = "~> 3.3"

Terraform has been successfully initialized!
```
## terraform Execution Plan

The goal is to see the execution plan of terraform in order to check that all is ok.

In the devopsdb directory do a `terraform plan`.

Take time to look at the result.


## Manage terraform's state properly

Doing a terraform apply will generate the terraform state file (terraform.tfstate) in the directory .terraform. The problem is : if we loose this file after creating all resources then terraform will not be able to do the job (ex : impossible to remove resources with terraform after). 

Terraform state is a very important file! It is used behind the scene to track
your provider resource internal identifier and how they are linked to the
project resources. 

This part consists in pushing that file on an OCI bucket (Object Storage) and referencing it
as your terraform back-end.

## Secure your state on a bucket

Send the state file to a bucket so that it can be secured and shared between
people in the team. In order to proceed:

- In the OCI web console, go to Identity/Compartments and create a compartment "DevOpsDbCompt1" (Update the number 1 in relation with your user number in the Workshop)
- In the OCI web console, go to Object Storage and create a bucket `MyBucket1ForTerraform` in your compartment (Update the number 1 of Bucket1 in relation with your user number in the Workshop).
- Upload the current state to your bucket with OCI CLI

```shell
cd .terraform
#create an empty state file
>> terraform.tfstate
#upload the state file to the Cloud Object Storage
oci os object put --bucket-name=MyBucket1ForTerraform --file=terraform.tfstate --name=/terraform/my-bucket/terraform.tfstate
#delete the empty state file
rm terraform.tfstate
```

- The way terraform supports the OCI provider as a backend for now is with
  pre-authenticated requests for now. It has 3 main limits that are, you cannot
  lock the resource, the pre-authenticated request can expire, and you cannot use a set of resource that is needed for the terraform `worskpace` feature. To continue with the setup, you should create a pre-authenticated requests for your file.
- In the OCI Web Console, click on your bucket. You should see the file you uploaded before. Click on the menu on the right of the file in order to create a pre-authenticated request (MyPreAuthReq) with "Permit reads on and writes to the Object" (choose a validation date that one year later than today). Copy the url in your file backend.old then rename this file to  backend.tf.

Note : Because the pre-authenticated request URL should remain secret and you can have
several backends to your terraform project, you cannot send the `backend.tf`
file to your project so in real life (not there) you will add it to  your `.gitignore` (and the same with env-vars).

# Choose the good AD and the good Shape

You must be careful because you have to choose the good AD. Remember that an Oracle Cloud Region (ex : ashburn) has 3 different Datacenters (AD1, AD2, and AD3) so you must choose the good AD with the good shape for the Database. ex : AD2 and a shape like "VM.Standard1.2". Sure you have to check if you have limitations on your Cloud Account before taking the good values. In the Cloud Web Console look at Governance/Service Limits.

If you do the workshop with Oracle People then they will tell us the good values. 

Ex : AD2 and VM.Standard1.2

Update the terraform files.

#### `variables.tf`

variable "DBNodeShape" {
​    default = "VM.Standard1.2"
}

#### `DBSystem.tf`

availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"

Note that AD1 --> [0], AD2 --> [1], AD3 --> [2]

Choose the good subnet according to the AD : subnet_id = "${oci_core_subnet.DbSubnetAD2.id}"

# Re-initialize your project

Once done, you can re-initialize your project state and verify you can now
access the remote state:

```shell
# Initialize the state from the `backend.tf` file
cd ..
terraform init
terraform plan

# Verify the state file
cat .terraform/terraform.tfstate
```

You shoud see that the terraform state has been initialized.

Next [03-devcs-terraform.md](03-devcs-terraform.md)

