terraform {
  backend "http" {
    address       = "https://objectstorage.us-ashburn-1.oraclecloud.com/p/5fyINW5IJhk0IvRYOiu18mLhFYUOsBWmnry8uVXYpRY/n/gse00014392/b/MyBucketForTerraform/o//terraform/my-bucket/terraform.tfstate"
    update_method = "PUT"
  }
}