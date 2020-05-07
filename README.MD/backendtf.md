


### backend.tf file
 




    terraform {
    required_version = "0.11.14"
    backend "s3" {
    bucket = "your s3 bucket name here"
    key    = "path/to/my/key"
    region = "us-east-1"
      }
     }



 
 
 
 
 