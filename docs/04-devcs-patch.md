# Patch a Database Instance in OCI with Developer Cloud Service

You will use OCI CLI to do that.

In DevCS like before you create a new Job. The name of the job is "Db_Instance_Patch".  Like before you add a git source control (it is your devops.git) and you add an OCIcli Builder and a Shell Unix Builder like below.

![Create Empty Project](images/New_job_2.png)

Note that we put the json parser jq (impossible to work without it) in our project because it is not on the Build VM (an enhancement request has been done for that).

Loot at the file patch.sh. 

First update the --compartment-id with the good value.

Then it is important to take time to understand so explore :

- oci db --help
- --query = JMESPath *query* option for JSON (go in internet to find information)
- jq = json parser (go in internet to find information)

You see some comments on line for patching Db because this feature is new and the OCI CLI version in DevCS is not the last. It will arrive soon and it is not a problem for this workshop because the goal is to learn using the OCI CLI and this job will give us the complete connection url of the Database due to OCI CLI.

Run this job only if the database is ready and look at the result in the build Log.

 

