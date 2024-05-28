resource "aws_sagemaker_space" "sagemaker_juypter_spaces" {
  for_each = {
    for index, p in local.sagemaker_user_profiles :
    p.user_name => p
  }
  domain_id  = aws_sagemaker_domain.sagemaker_domain.id
  space_name = "${each.value.user_name}-${var.use_case}-jupyter-space"

  ownership_settings {
    owner_user_profile_name = each.value.profile_name
  }

  space_sharing_settings {
    sharing_type = "Private"
  }

  space_settings {
    app_type = "JupyterLab"
  }
}

resource "aws_sagemaker_space" "sagemaker_code_spaces" {
  for_each = {
    for index, p in local.sagemaker_user_profiles :
    p.user_name => p
  }
  domain_id  = aws_sagemaker_domain.sagemaker_domain.id
  space_name = "${each.value.user_name}-${var.use_case}-code-space"

  ownership_settings {
    owner_user_profile_name = each.value.profile_name
  }

  space_sharing_settings {
    sharing_type = "Private"

  }
  space_settings {
    app_type = "CodeEditor"
  }
}
