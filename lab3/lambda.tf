resource "archive_file" "lambda_package" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_function"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "send_email" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"

  filename = archive_file.lambda_package.output_path

  source_code_hash = archive_file.lambda_package.output_base64sha256

  environment {
    variables = {

      RECIPIENT_EMAIL = var.recipient_email
    }
  }
}
