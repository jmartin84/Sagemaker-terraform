resource "aws_iam_role" "sagemaker_role" {
  name                = "BU${var.use_case}SagemakerRole"
  path                = "/"
  assume_role_policy  = data.aws_iam_policy_document.sagemaker_role_policy.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"]
}



data "aws_iam_policy_document" "sagemaker_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}
