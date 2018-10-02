#!/bin/bash
export DBSYSTEMID=$(oci db system list --compartment-id="ocid1.compartment.oc1..aaaaaaaach4c3i5kpecjfjqwp3wfjfmbbjniyzieaxhcjs6c73ya2wl6vaxq" --query "data[?\"display-name\"=='MyTFDatabaseNode'].{Id:id}" | ./Jq/jq-linux64 .[0].Id)
echo "DBSYSTEMID = $DBSYSTEMID"

export DBID=$(oci db database list --db-system-id=$dbsystemid --compartment-id=ocid1.compartment.oc1..aaaaaaaach4c3i5kpecjfjqwp3wfjfmbbjniyzieaxhcjs6c73ya2wl6vaxq | ./Jq/jq-linux64 .data[].id)
echo "DBID = $DBID"

export DBPATCHID=$(oci db patch list by-db-system --all --db-system-id=$dbsystemid | ./Jq/jq-linux64 .data[].id)
echo "DBPATCHID = $DBPATCHID)

#Patch DBID
#oci db database patch --database-id=$dbid --patch-action="APPLY" --patch-id=$dbpatchid

#Backup after Patch
#oci db backup create --database-id=$dbid --display-name="backup before patch 18.3" --wait-for-state="ACTIVE"