# Private S3 Bucket

This folder contains a Terraform module to provision an AWS S3 bucket with no
public access and access logging enabled.

## Usage

```terraform
module "access_logs" {
  source = "../modules/access-logs-s3-bucket"

  bucket = "artichoke-forge-project-infrastructure-terraform-state-logs"
}

module "bucket" {
  source = "../modules/private-s3-bucket"

  bucket = "artichoke-forge-project-infrastructure-terraform-state"
  access_logs_bucket = module.access_logs.name
}
```

## Parameters

- `bucket`: The name of the bucket to create.
- `access_logs_bucket`: The name of the bucket to use as an access logs
  destination.
- `write_protected`: Disallow all write operations.

## Outputs

- `arn`: The ARN of the created bucket.
- `name`: The name of the created bucket.
