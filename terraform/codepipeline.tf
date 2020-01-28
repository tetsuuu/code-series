resource "aws_codepipeline" "codepipeline" {
  name     = "${var.service_name}-${var.short_env}-${var.prj}"
  role_arn = aws_iam_role.codepipeline.arn

  artifact_store {
    location = var.artifact_bucket
    type     = "S3"

    encryption_key {
      id   = "arn:aws:kms:${var.region}:${data.aws_caller_identity.self.account_id}:alias/aws/s3"
      type = "KMS"
    }
  }

  // Require source stage
  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "Branch"               = "init-branch"
        "Owner"                = "uluru-kinoshitat"
        "Repo"                 = "code-series"
        "PollForSourceChanges" = "false"
        "OAuthToken"           = "" // TODO
      }

      input_artifacts  = []
      name             = "Source"
      output_artifacts = ["source_output"]
      owner            = "ThirdParty"
      provider         = "GitHub"
      run_order        = 1
      version          = "1"
    }
  }

  dynamic "stage" {
    for_each = var.build_projects

    content {
      name = stage.value

      action {
        category         = "Build"
        name             = "Build"
        owner            = "AWS"
        input_artifacts  = ["source_output"]
        output_artifacts = ["${stage.value}_build_output"]
        provider         = "CodeBuild"
        run_order        = 1
        version          = "1"

        configuration = {
          "ProjectName" = aws_codebuild_project.temp_build.name // TODO List -> Map stage.key
        }
      }
    }
  }

  tags = {
    Name     = "${var.service_name}-${var.short_env}-${var.prj}"
    Service  = var.service_name
    Project  = var.prj
    Env      = var.short_env
    Pipeline = var.pipeline_description
  }
}


