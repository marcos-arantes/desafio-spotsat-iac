
# cloudfront/main.tf

resource "aws_s3_bucket" "spotsat_bucket" {
  bucket = "spotsat-application-bucket"
  acl    = "private"

  tags = {
    Name = "spotsat-application-bucket"
  }
}

resource "aws_cloudfront_distribution" "spotsat_distribution" {
  origin {
    domain_name = "${aws_s3_bucket.spotsat_bucket.bucket_regional_domain_name}"
    origin_id   = "origin_1"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "origin_1"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

output "distribution_id" {
  value = aws_cloudfront_distribution.spotsat_distribution.id
}

output "bucket_name" {
  value = aws_s3_bucket.spotsat_bucket.bucket
}

output "bucket_domain_name" {
  value = aws_s3_bucket.spotsat_bucket.bucket_domain_name
}
