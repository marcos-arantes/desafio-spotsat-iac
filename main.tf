# main.tf

module "vpc" {
  source = "./vpc"
}

module "amplify" {
  source = "./amplify"
}

module "cloudfront" {
  source        = "./cloudfront"
}
