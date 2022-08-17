terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.9.0"
    }
  }
}

resource "aws_s3_object" "delegated_service_documentation_prod" {
  count = "${var.env == "prod" ? 1 : 0}"
  bucket = "727646359971-common-services-delegated-service-documentation"
  key    = "${var.env}/${var.current_account_id}/${var.application_name}.json"
  acl    = "bucket-owner-full-control"

  content_type = "application/json"
  content      = jsonencode({
    applicationname = var.application_name
    slack           = var.slack
    about_file     = "toberemoved"
    owner          = var.owner
    technicalowner = var.technicalowner
    servicesla     = var.servicesla
    growthmetric   = var.growthmetric
    aktivitetskode = var.aktivitetskode

  })
}

resource "aws_s3_object" "delegated_service_documentation_test" {
  count = "${var.env != "prod" ? 1 : 0}"
  bucket = "167605120605-common-services-delegated-service-documentation"
  key    = "${var.env}/${var.current_account_id}/${var.application_name}.json"
  acl    = "bucket-owner-full-control"

  content_type = "application/json"
  content      = jsonencode({
    applicationname = var.application_name
    slack           = var.slack
    about_file     = "toberemoved"
    owner          = var.owner
    technicalowner = var.technicalowner
    servicesla     = var.servicesla
    growthmetric   = var.growthmetric
    aktivitetskode = var.aktivitetskode

  })
}

