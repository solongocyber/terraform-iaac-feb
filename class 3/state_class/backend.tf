terraform {
     required_version = "0.11.14"
     backend "s3" {
    bucket = "state-class-solongo"
    # dynamodb_table = "state_class"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
