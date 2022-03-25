resource "aws_s3_bucket_object" "delegated_service_documentation" {
  bucket = "061938725231-infrademo-delegated-service-documentation"
  key    = "${var.env}/${var.current_account_id}/${var.name_prefix}.json"
  acl    = "bucket-owner-full-control"
  # local.service_documentation_bucket
  content = jsonencode({
  applicationname = var.name_prefix
  slack = var.slack 

  api_gateway_arn = "toberemoved"
  # OR
  swagger_file = "toberemoved"

  about_file = "toberemoved"
  owner = var.owner 
  technicalowner = var.technicalowner
  servicesla = var.servicesla 
  growthmetric = var.growthmetric 
  aktivitetskode = var.aktivitetskode 

  })
  content_type = "application/json"
}

module "api_gateway_export" {
    source          = "rojopolis/api-gateway-export-aws"
    api_gateway_id  = var.api_gateway_id
    stage_name      = "prod"
    region          = "eu-west-1"
    extensions      = "postman"
    format          = "json"
    openapi_version = "oas30"
}

resource "aws_s3_bucket_object" "openapi_documentation" {
  bucket = "061938725231-infrademo-delegated-service-documentation"
  key    = "${var.current_account_id}/${var.name_prefix}.json"
  acl    = "bucket-owner-full-control"
  # local.service_documentation_bucket
  content = jsonencode({
  content = module.api_gateway_export.api_export

  })
  content_type = "application/json"
}

