provider "aws" {
  endpoints {
    ec2 = "http://localhost:4566"
    sts = "http://localhost:4566"
    s3 = "http://s3.localhost.localstack.cloud:4566"
    dynamodb = "http://localhost:4566"
  }
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}