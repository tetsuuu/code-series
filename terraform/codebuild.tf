// Codebuild definition
resource "aws_codebuild_project" "temp_build" {
  name           = "${var.service_name}-${var.short_env}-${var.prj}"
  description    = var.build_description
  badge_enabled  = false
  build_timeout  = var.retention_period
  encryption_key = "arn:aws:kms:${var.region}:${data.aws_caller_identity.self.account_id}:alias/aws/s3"
  service_role   = aws_iam_role.codebuild.arn

  artifacts {
    encryption_disabled    = false
    override_artifact_name = false
    type                   = "NO_ARTIFACTS"
  }

  cache {
    modes = []
    type  = "NO_CACHE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_LARGE"
    image                       = "aws/codebuild/amazonlinux2-aarch64-standard:1.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false
    type                        = "ARM_CONTAINER"

    environment_variable {
      name  = "recreate_action"
      value = var.recreate_action
      type  = "PLAINTEXT"
    }

    environment_variable {
      name  = "job_description"
      value = var.job_description
      type  = "PLAINTEXT"
    }

    environment_variable {
      name  = "ACCOUNT_ID"
      value = data.aws_caller_identity.self.account_id
      type  = "PLAINTEXT"
    }

    environment_variable {
      name  = "ES_SERVER"
      value = var.ess_endpoint
      type  = "PLAINTEXT"
    }
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    buildspec           = "buildspec.yml"
    git_clone_depth     = 1
    insecure_ssl        = false
    location            = "https://github.com/uluru-kinoshitat/code-series.git"
    report_build_status = false
    type                = "GITHUB"
  }

  tags = {
    Name    = "${var.service_name}-${var.short_env}-${var.prj}"
    Service = var.service_name
    Project = var.prj
    Env     = var.short_env
    Job     = var.recreate_action
  }
}
