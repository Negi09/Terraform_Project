resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "controls" {
  bucket = aws_s3_bucket.mybucket.id # ensuring the bucket prefernefor the owner

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3-public-access" { 
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false  #enabling public access
  block_public_policy     = false #enabling public access
  ignore_public_acls      = false #enabling public access
  restrict_public_buckets = false #enabling public access
} 

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.controls,
    aws_s3_bucket_public_access_block.s3-public-access,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "object1"{
  bucket =aws_s3_bucket.mybucket.id
  key="index.html"
  source ="index.html"
   acl="public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "object2"{
  bucket =aws_s3_bucket.mybucket.id
  key="error.html"
  acl="public-read"
  source ="error.html"
  content_type = "text/html"
}

resource "aws_s3_object" "object3"{
  bucket =aws_s3_bucket.mybucket.id
  key="Math.png"
  source ="Math.png"
   acl="public-read"
  content_type = "image/png"
}

resource "aws_s3_object" "object4"{
  bucket =aws_s3_bucket.mybucket.id
  key="Science.png"
  source ="Science.png"
   acl="public-read"
  content_type = "image/png"
}

resource "aws_s3_object" "object5"{
  bucket =aws_s3_bucket.mybucket.id
  key="construction.png"
  source ="construction.png"
  acl="public-read" 
 
}

resource "aws_s3_object" "object6"{
  bucket =aws_s3_bucket.mybucket.id
  key="programming.png"
  source ="programming.png"
  acl="public-read"
  
}

resource "aws_s3_object" "object7"{
  bucket =aws_s3_bucket.mybucket.id
  key="learning.png"
  source ="learning.png"
  acl="public-read" 
}

resource "aws_s3_bucket_website_configuration" "web_config" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  depends_on=[aws_s3_bucket_acl.example]
  }
