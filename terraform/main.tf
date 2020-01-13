provider "aws" {
  region  = "us-east-1"
  version = "~> 2.42.0"
}

data "aws_caller_identity" "self" {}

variable "region" {
  default = "us-east-1"
}

variable "service_name" {
  default = "maintenance"
}

variable "short_env" {
  default = "sandbox"
}

variable "prj" {
  default = "code"
}
variable "artifact_bucket" {}

variable "pipeline_description" {
  default = "test pipeline"
}

variable "retention_period" {
  default = 60
}

variable "build_description" {
  default = "test Jobs"
}

variable "recreate_action" {
  default = "date"
}

variable "job_description" {
  default = "echo date"
}

variable build_projects {
  type    = list(string)
  default = ["date", "pwd", "id"]
}

/* Using Object class
variable build_projects {
  type    = list(object({
    input_artifacts = string
    output_artifacts = string
    provider = string
    version = string
    configuration = list(object({
      ProjectName =string
    }))
  }))
}

variable "input_artifacts" {}
variable "output_artifacts" {}
variable "provider" {}
variable "version" {}
variable "configuration" {}
variable "ProjectName" {}
*/
