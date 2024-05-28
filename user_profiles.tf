resource "aws_sagemaker_user_profile" "sagemaker_user_profiles" {
  for_each          = toset(var.sagemaker_profiles)
  domain_id         = aws_sagemaker_domain.sagemaker_domain.id
  user_profile_name = lower("${var.use_case}-${each.value}-user-profile")

  single_sign_on_user_identifier = var.auth_mode == "SSO" ? "UserName" : null
  single_sign_on_user_value      = var.auth_mode == "SSO" ? each.value : null

  user_settings {
    execution_role = aws_iam_role.sagemaker_role.arn
  }
}

locals {
  sagemaker_user_profiles = [
    for profile in var.sagemaker_profiles : {
      "user_name"    = "${profile}",
      "profile_name" = "${aws_sagemaker_user_profile.sagemaker_user_profiles[profile].user_profile_name}"
    }
  ]
}
