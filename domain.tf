resource "aws_sagemaker_domain" "sagemaker_domain" {
  domain_name = "${var.use_case}-domain"
  vpc_id      = var.vpc_id
  subnet_ids  = var.subnet_ids
  auth_mode   = var.auth_mode

  default_user_settings {
    execution_role = aws_iam_role.sagemaker_role.arn
  }

  default_space_settings {
    execution_role = aws_iam_role.sagemaker_role.arn
    jupyter_server_app_settings {
      default_resource_spec {
        instance_type = "system"
      }
    }
  }
}
