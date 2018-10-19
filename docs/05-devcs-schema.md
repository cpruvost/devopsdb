# Create the schema QUIZFLYWAY on OCI in Developer Cloud Service

You will use SQLcl to do that (the SQL Command Line that replaces the old SQL*plus).

In DevCS like before you create a new Job. The name of the job is "Db_Schema_Create".  Like before you add a git source control (it is your devops.git) and you add a Shell Unix Builder with the code below :

```shell
export DBNodePublicIP=$(cat /tmp/outputIP.txt)
echo "DBNodePublicIP = $DBNodePublicIP"
export DBCONSTRING=$(cat /tmp/outputDBCONSTRING.txt)
echo "DBCONSTRING = $DBCONSTRING"
cd ./Schema
exit | sql system/BEstrO0ng_#11@$DBNodePublicIP:1521/$DBCONSTRING @./create_schema.sql
```

Look at the file create_schema.sql. 

Note that we will use a feature of the Oracle Database Enterprise Edition (EBR = Edition base Redefinition). This feature is nice in order to manage versions on the schema.

Run the job only if the database is ready and if the job patch is successful. Look at the result.

 