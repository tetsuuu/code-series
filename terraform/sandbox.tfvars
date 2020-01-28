region               = "us-east-1"
service_name         = "maintenance"
short_env            = "sandbox"
prj                  = "code"
pipeline_description = "test pipeline"
build_description    = "test build"
recreate_action      = "date"
job_description      = "test job"
artifact_bucket      = "kinoshita-poc-bucket"

build_projects = [
  "date",
  "pwd",
  "id",
  "poc",
  /*  Object version
  {
    input_artifacts = "source_output"
    output_artifacts = "build_output"
    provider = "CodeBuild"
    version = "1"
    configuration = {
      ProjectName = "date"
    }
  },
    {
    input_artifacts = "source_output"
    output_artifacts = "build_output"
    provider = "CodeBuild"
    version = "1"
    configuration = {
      ProjectName = "pwd"
    }
  },
    {
    input_artifacts = "source_output"
    output_artifacts = "build_output"
    provider = "CodeBuild"
    version = "1"
    configuration = {
      ProjectName = "id"
    }
  },
    {
    input_artifacts = "source_output"
    output_artifacts = "build_output"
    provider = "CodeBuild"
    version = "1"
    configuration = {
      ProjectName = "poc"
    }
  }
*/
]

