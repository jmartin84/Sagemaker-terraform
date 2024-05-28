variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "use_case" {
  type = string
}

variable "sagemaker_profiles" {
  type = list(string)
}

variable "auth_mode" {
  type    = string
  default = "IAM"
}

