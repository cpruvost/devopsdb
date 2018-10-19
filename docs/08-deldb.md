# Option : remove the Database

It is very simple to remove the database. You just have to use terraform again.

Create a new job "Db_Instance_Destroy" and choose copy the "Db_Instance_Create".

Click on configure and update the Unix Shell Builder with :

```shell
source ./env-vars
terraform --version
terraform init
terraform plan -no-color
terraform destroy -auto-approve -no-color
```

If you run the Job then the database will be destroyed. It will take about 15 minutes.

 