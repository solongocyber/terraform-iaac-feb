resource "aws_s3_bucket" "b" {
  bucket = "solongobucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}



//Don't change anything in  this file

//It's just template
