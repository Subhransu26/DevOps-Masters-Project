module "artifact_bucket" {
  source      = "./modules/s3"
  bucket_name = "devops-masters-artifacts-bucket-2025"
}

module "iam" {
  source = "./modules/iam"
}

module "codebuild" {
  source             = "./modules/codebuild"
  repo_url = "https://github.com/Subhransu26/DevOps-Masters-Project"
  codebuild_role_arn = module.iam.codebuild_role_arn
}

module "codedeploy" {
  source             = "./modules/codedeploy"
  codedeploy_role_arn = module.iam.codedeploy_role_arn
}

module "codepipeline" {
  source                = "./modules/codepipeline"
  codepipeline_role_arn = module.iam.codepipeline_role_arn
  artifact_bucket       = module.artifact_bucket.bucket_name
  repo_owner            = "Subhransu26"
  repo_name             = "DevOps-Masters-Project"
  repo_branch           = "main"
  github_token          = var.github_token
  codebuild_project_name = module.codebuild.codebuild_project_name
  codedeploy_app_name   = module.codedeploy.codedeploy_app_name
  codedeploy_group_name = "devops-deployment-group"
}
