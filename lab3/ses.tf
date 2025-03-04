resource "aws_ses_domain_identity" "ses_domain" {
  domain = var.sender_email
}

