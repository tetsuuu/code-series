region               = ""
service_name         = ""
short_env            = ""
prj                  = ""
pipeline_description = ""
build_description    = ""
recreate_action      = ""
job_description      = ""
artifact_bucket      = ""

ess_endpoint = ""

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

