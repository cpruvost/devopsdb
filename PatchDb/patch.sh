#!/bin/bash
export DBSYSTEMID=$(oci db system list --compartment-id="ocid1.compartment.oc1..aaaaaaaach4c3i5kpecjfjqwp3wfjfmbbjniyzieaxhcjs6c73ya2wl6vaxq" --query "data[?\"display-name\"=='MyTFDatabaseNode'].{Id:id}" | ./Jq/jq-linux64 .[0].Id)
DBSYSTEMID=${DBSYSTEMID#'"'}
DBSYSTEMID=${DBSYSTEMID::-1}
echo "DBSYSTEMID = $DBSYSTEMID"

export DBID=$(oci db database list --db-system-id=$DBSYSTEMID --compartment-id=ocid1.compartment.oc1..aaaaaaaach4c3i5kpecjfjqwp3wfjfmbbjniyzieaxhcjs6c73ya2wl6vaxq --query "data[?\"db-name\"=='aTFdb'].{Id:id}" | ./Jq/jq-linux64 .data[].id)
DBID=${DBID#'"'}
DBID=${DBID::-1}
echo "DBID = $DBID"

export DBPATCHID=$(oci db patch list by-db-system --all --db-system-id=$DBSYSTEMID | ./Jq/jq-linux64 .data[].id)
DBPATCHID=${DBPATCHID#'"'}
DBPATCHID=${DBPATCHID::-1}
echo "DBPATCHID = $DBPATCHID)

#Patch DBID
#oci db database patch --database-id=$DBID --patch-action="APPLY" --patch-id=$DBPATCHID

#Backup after Patch
#oci db backup create --database-id=$DBID --display-name="backup before patch 18.3" --wait-for-state="ACTIVE"