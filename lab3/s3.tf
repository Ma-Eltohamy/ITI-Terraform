resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.terraform_state.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.send_email.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "terraform.tfstate"
  }
}
