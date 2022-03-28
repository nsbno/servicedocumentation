resource "aws_s3_object" "delegated_service_documentation" {
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

data "aws_api_gateway_export" "service" {
  rest_api_id = var.api_gateway_id
  stage_name  = "prod"
  export_type = "oas30"
}

resource "aws_s3_object" "openapi_documentation" {
  bucket = "061938725231-infrademo-delegated-service-documentation"
  key    = "${var.current_account_id}/${var.name_prefix}.json"
  acl    = "bucket-owner-full-control"
  # local.service_documentation_bucket
  content = jsonencode({
  content = data.aws_api_gateway_export.service.body

  })
  content_type = "application/json"
}

