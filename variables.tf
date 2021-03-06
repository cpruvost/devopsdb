# Cloud Domain Information 
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}

# DBSystem Information
variable "DBNodeShape" {
    default = "VM.Standard1.2"
}

variable "CPUCoreCount" {
    default = "2"
}

variable "DBEdition" {
    default = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
}

variable "DBAdminPassword" {
    default = "BEstrO0ng_#11"
}

variable "DBName" {
    default = "aTFdb"
}

variable "DBVersion" {
    default = "18.2.0.0"
}

variable "DBDisplayName" {
    default = "MyTFDB"
}

variable "DBDiskRedundancy" {
    default = "NORMAL"
}

variable "DBNodeDisplayName" {
    default = "MyTFDatabaseNode"
}

variable "DBNodeHostName" {
    default = "myOracleDB"
}

variable "HostUserName" {
    default = "opc"
}

variable "NCharacterSet" {
	default = "AL16UTF16"
}

variable "CharacterSet" {
	default = "AL32UTF8"
}

variable "DBWorkload" {
	default = "OLTP"
}

variable "PDBName" {
	default = "MYPDB"
}

variable "DataStorageSizeInGB" {
	default = "256"
}

variable "LicenseModel" {
	default = "LICENSE_INCLUDED"
}

variable "NodeCount" {
	default = "1"
}
