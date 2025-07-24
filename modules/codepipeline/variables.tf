variable "codepipeline_role_arn" {
  type = string
}

variable "artifact_bucket" {
  type = string
}

variable "repo_owner" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "repo_branch" {
  type = string
}

variable "github_token" {
  type = string
}

variable "codebuild_project_name" {
  type = string
}

variable "codedeploy_app_name" {
  type = string
}

variable "codedeploy_group_name" {
  type = string
}
