resource "aws_codedeploy_app" "app" {
  name = "devops-masters-codedeploy"
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "app_group" {
  app_name              = aws_codedeploy_app.app.name
  deployment_group_name = "devops-deployment-group"
  service_role_arn      = var.codedeploy_role_arn

  deployment_style {
    deployment_type = "IN_PLACE"
    deployment_option = "WITHOUT_TRAFFIC_CONTROL"
  }

  ec2_tag_filter {
    key   = "Name"
    type  = "KEY_ONLY"
    value = ""
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}
