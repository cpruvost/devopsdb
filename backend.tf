terraform {
  backend "http" {
    address       = "https://objectstorage.us-ashburn-1.oraclecloud.com/p/tQjHRvJefWzXjMJV99nqQFcWm0CFK1k_RrdKqrl1ldg/n/gse00014392/b/MyBucketForTerraform/o//terraform/my-bucket/terraform.tfstate"
    update_method = "PUT"
  }
}