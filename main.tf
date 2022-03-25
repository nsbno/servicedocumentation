resource "aws_s3_bucket_object" "delegated_service_documentation" {
  bucket = "061938725231-infrademo-delegated-service-documentation"
  key    = "stage/${var.current_account_id}/${var.name_prefix}.json"
  acl    = "bucket-owner-full-control"
  # local.service_documentation_bucket
  content = jsonencode({
  applicationname = var.name_prefix
  slack = var.slack 

  api_gateway_arn = "toberemoved"
  # OR
  swagger_file = "toberemoved"

  about_file = var.about_file
  owner = var.owner 
  technicalowner = var.technicalowner
  servicesla = var.servicesla 
  growthmetric = var.growthmetric 
  aktivitetskode = var.aktivitetskode 

  })
  content_type = "application/json"
}
