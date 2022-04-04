terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.74.0, < 4.0.0"
    }
  }
}

resource "aws_s3_bucket_object" "delegated_service_documentation" {
  bucket = "727646359971-common-services-delegated-service-documentation"
  key    = "${var.env}/${var.current_account_id}/${var.name_prefix}.json"
  acl    = "bucket-owner-full-control"

  content_type = "application/json"
  content      = jsonencode({
    applicationname = var.application_name
    slack           = var.slack

    api_gateway_arn = "toberemoved"
    # OR
    swagger_file    = "toberemoved"

    about_file     = "toberemoved"
    owner          = var.owner
    technicalowner = var.technicalowner
    servicesla     = var.servicesla
    growthmetric   = var.growthmetric
    aktivitetskode = var.aktivitetskode

  })
}

data "aws_api_gateway_export" "service" {
  rest_api_id = var.api_gateway_id
  stage_name  = var.api_gateway_stage_name
  export_type = "swagger"
}

resource "aws_s3_bucket_object" "openapi_documentation" {
  bucket = "727646359971-common-services-service-documentation"
  key    = "json/${var.name_prefix}.json"
  acl    = "public-read"

  content_type = "application/json"
  content      = data.aws_api_gateway_export.service.body
}

