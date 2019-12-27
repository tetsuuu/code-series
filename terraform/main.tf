provider "aws" {
  region  = "us-east-1"
  version = "~> 2.42.0"
}

data "aws_caller_identity" "self" {}

variable "region" {
  default = "ap-northeast-1"
}

variable "service_name" {
  default = "njss"
}

variable "short_env" {
  default = "stg"
}

variable "prj" {
  default = "artom"
}
variable "artifact_bucket" {}

variable "pipeline_description" {
  default = "Saturday pipeline"
}

variable "retention_period" {
  default = 60
}

variable "build_description" {
  default = "every Saturday Jobs"
}

variable "recreate_action" {
  default = "06_enable_schedule"
}

variable "job_description" {
  default = "Enable ECS task schedules"
}

variable "ess_endpoint" {
  default = "http://njss-stg-ess-proxy.ap-northeast-1.elasticbeanstalk.com"
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
