# DevOpsDb Workshop (UNDER CONSTRUCTION - Do Not Use)

This workshop guides you through the setup, and the configuration of an Oracle Developer Cloud Service pipeline in order to create an Oracle Database on Oracle Cloud Infrastructure (OCI) with the schema of an application called "QUIZFLYWAY". 

The steps of the pipeline are :

- 1) Create a Database instance on OCI with `terraform`
- 2) Patch and Backup a Database instance on OCI with `OCI CLI`
- 3) Create the schema QUIZFLYWAY with `SQLcl`
- 4) Create all the objects of the schema QUIZFLYWAY with `Flyway` 

Do not hesitate to use it and ask for enhancements if you have any ideas.

## Table of Contents

1. Installation and Configuration [01-install.md](docs/01-install.md)
2. Remote state management, see `branch:02-demo` and
    [02-remote-state.md](docs/02-remote-state.md)

## Feedback

If you like this repository, do not hesitate to add a star. If you have any
questions or ideas to enhance it, open an issue. Have fun!
