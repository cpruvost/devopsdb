#!/bin/bash
export DBSYSTEMID=$(oci db system list --compartment-id="ocid1.compartment.oc1..aaaaaaaach4c3i5kpecjfjqwp3wfjfmbbjniyzieaxhcjs6c73ya2wl6vaxq" --query "data[?\"display-name\"=='MyTFDatabaseNode'].{Id:id}" | ./Jq/jq-linux64 .[0].Id)
echo "DBSYSTEMID= $DBSYSTEMID"