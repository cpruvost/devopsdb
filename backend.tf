terraform {
  backend "http" {
    address       = "https://objectstorage.us-ashburn-1.oraclecloud.com/p/xxxxxxx/b/MyBucketForTerraform/o//terraform/my-bucket/terraform.tfstate"
    update_method = "PUT"
  }
}