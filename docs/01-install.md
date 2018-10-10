# Installation and configuration

## Install the required components

First you need an OCI account. If you do the workshop with Oracle then the trainer will give you information to connect on [OCI](https://cloud.oracle.com/en_US/sign-in). So you need :

- Cloud Account Name (= tenant). Ex : gse00012345.
- Cloud User. Ex : devopsdb.user1
- Cloud Password. Ex : Alpha_2014_!

If you don't do the workshop with Oracle then you can do a [Trial](https://cloud.oracle.com/en_US/database)

In order to speed up your work, if you do the workshop with Oracle then the trainer will give you information for connecting to a Linux VM with all the good prerequisites. You just then need to connect to the Linux VM with ssh (Using Putty on windows for ex). So you need :

- Ip Adress of the VM
- user : opc (note that you can be root with sudo -s)
- SSh Workshop Key : [Ssh Public Key](https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/DevOpsDbBucket/o/id_rsa.pub), [Ssh Private Key](https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/DevOpsDbBucket/o/id_rsa), [Ssh Putty Key](https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/DevOpsDbBucket/o/id_rsa.ppk)

If you don't do the workshop with Oracle then a [DevOpsDBVMImage](https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/DevOpsDbBucket/o/DevOpsDbVMImage) is available for you. You just have to import this image in your custom images and then to create an Oracle Linux VM from this image.

If you do not want to work on the DevOpsDBVM then you have to install a set of tools on your Linux laptop or on a Linux VM on your laptop :

- [Terraform 0.11.7](https://www.terraform.io/downloads.html) You can download and uncompress it so that it can be accessed from your `PATH`. It might also be installed from your favorite package manager.
- Terraform [OCI Provider 2.2.0+ or more](https://github.com/oracle/terraform-provider-oci/releases) You can download and uncompress it as part of your plugins, in `~/.terraform.d/plugins` (see [here](https://github.com/oracle/terraform-provider-oci) for instructions on how to install)
- The [OCI Command Line Interface](https://github.com/oracle/oci-cli) or OCI CLI. The fastest way to get the latest version on Mac/Linux, assuming you have `python` or `python3` installed with `pip`, is to run `sudo pip install oci-cli`.
- [Oracle SQLcl](https://www.oracle.com/technetwork/developer-tools/sqlcl/overview/index.html), that replaces the old SQL*Plus in 12c.
- [Git](https://git-scm.com/downloads)
- You might also want to install and use more tools, like `jq`, `ssh`, `openssl`, `curl`...

## Configure access to your account

In order to access OCI from the Command Line Interface or `terraform`, you must
have a user registered with OCI and you have to declare an API Key in your user `API Keys` section of your user.

In order to speed up your work, you can just download API Keys in the DevOpsDbVM : [Public API Key](https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/DevOpsDbBucket/o/bmcs_api_key_public.pem), [Private API Key](https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/DevOpsDbBucket/o/bmcs_api_key.pem), [FingerPrint API Key](https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/DevOpsDbBucket/o/bmcs_api_key_fingerprint)

```text
In order to download API Keys use curl : ex curl https://objectstorage.us-ashburn.***.bmcs_api_key_public.pem >> bmcs_api_key_public.pem
```

Last, the easiest way to access OCI from terraform is probably to configure the OCI CLI with the `oci setup config` command in the DevOpsDbVM. Note that you must be connected to OCI in order to get all the information needed. Let the all the location to default. The private Key file is the private API Key file.

```text
[...]
Enter a location for your config [/home/opc/.oci/config]: 
Enter a user OCID: ocid1.user.oc1..aaaaaaaaxxx
Enter a tenancy OCID: ocid1.tenancy.oc1..aaaaaaaaxxx
Enter a region (e.g. eu-frankfurt-1, uk-london-1, us-ashburn-1, us-phoenix-1): us-ashburn-1 
Do you want to generate a new RSA key pair? (If you decline you will be asked to supply the path to an existing key.) [Y/n]: n
Enter the location of your private key file: /home/opc/bmcs_api_key.pem
Fingerprint: bd:96:eb:97:61:ed:8d:5e:a0:6c:d2:86:d6:xx:xx:xx
Config written to /home/opc/.oci/config
```

Your configuration should be kept in a config file like below:

```shell
% cat /home/opc/.oci/config
[DEFAULT]
user=ocid1.user.oc1..aaaaaaaaxxx
fingerprint=bd:96:eb:97:61:ed:8d:5e:a0:6c:d2:86:d6:xx:xx:xx
key_file=/home/opc/bmcs_api_key.pem
tenancy=ocid1.tenancy.oc1..aaaaaaaaxxx
region=us-ashburn-1
```

You can test it is working as expected with a command like below:

```shell
 oci iam region list --query='data[].{name:name}' --output table
+----------------+
| name           |
+----------------+
| eu-frankfurt-1 |
| us-ashburn-1   |
| uk-london-1    |
| us-phoenix-1   |
+----------------+
```

