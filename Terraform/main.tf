resource "aws_api_gateway_rest_api" "notification_api" {
  name = "notification-api"
}

resource "aws_lambda_function" "notification_handler" {
  function_name = "notificationHandler"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  filename      = "../lambda/notification.zip"
  timeout       = 10
}

resource "aws_sns_topic" "sms_topic" {
  name = "sms-topic"
}