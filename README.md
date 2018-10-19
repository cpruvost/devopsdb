# DevOpsDb Workshop

This workshop guides you through the setup, and the configuration of an Oracle Developer Cloud Service pipeline in order to create an Oracle Database on Oracle Cloud Infrastructure (OCI) with the schema of an application called "QUIZFLYWAY". 

The steps of the pipeline are :

- Create a Database instance on OCI with `terraform`
- Patch and Backup a Database instance on OCI with `OCI CLI`
- Create the schema QUIZFLYWAY with `SQLcl`

Do not hesitate to use it and ask for enhancements if you have any ideas. We will use Developer CS for the pipeline but you can use another solution if you want (Jenkins for ex).

Note : After this workshop you can do the workhop "Create all the objects of the schema QUIZFLYWAY with `Flyway`" 

## Table of Contents

1. Installation and Configuration [01-install.md](docs/01-install.md)
2. Configuration of `terraform`[02-terraform.md](docs/02-terraform.md)
3. Create a Database Instance on OCI in `Developer Cloud Service` [03-devcs-terraform.md](docs/03-devcs-terraform.md)
4. Patch a Database Instance on OCI in `Developer Cloud Service` [04-devcs-patch.md](docs/04-devcs-patch.md)
5. Create the schema QUIZFLYWAY on OCI in `Developer Cloud Service` [05-devcs-schema.md](docs/05-devcs-schema.md)
6. Create the pipeline in `Developer Cloud Service` [06-pipeline.md](docs/06-pipeline.md)
7. Connect to the schema with `Oracle SQL Developer`  [07-sqldev.md](docs/07-sqldev.md)
8. Option : remove the Database if needed  [08-deldb.md](docs/08-deldb.md)

## Feedback

If you like this repository, do not hesitate to add a star. If you have any
questions or ideas to enhance it, open an issue. Have fun!