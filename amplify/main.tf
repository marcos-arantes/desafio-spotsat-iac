resource "aws_amplify_app" "spotsat_app" {
  name        = "spotsat-amplify-app"
  repository  = var.repository
  oauth_token = var.oauth_token
  platform    = "WEB_COMPUTE"
}

resource "aws_amplify_branch" "spotsat_main" {
  app_id      = aws_amplify_app.spotsat_app.id
  branch_name = "main"
  framework   = "Next.js - SSR"

}

output "default_domain" {
  value = "${aws_amplify_branch.spotsat_main.branch_name}.${aws_amplify_app.spotsat_app.default_domain}"
}
