variable "name_prefix" {
  description = "A prefix used for naming resources."
  type        = string
}

variable "env" {
  description = "Variable to define if the setup is for dev, test, stage, prod env"
  type        = string
}

variable "current_account_id" {
  description = "Account number of current account"
  type        = string
}

variable "slack" {
  description = "Name of slack channel to reach team responsible for the application"
  type        = string
}

variable "owner" {
  description = "Email of the financial owner of the solution"
  type        = string
}

variable "technicalowner" {
  description = "Email of the technical owner of the solution "
  type        = string
}

variable "servicesla" {
  description = "SLA set for service listed as procentage of time guaranteed available"
  type        = string
}

variable "growthmetric" {
  description = "A prefix used for naming resources."
  type        = string
}

variable "aktivitetskode" {
  description = "A prefix used for naming resources."
  type        = string
}

variable "api_gateway_id" {
  description = "A prefix used for naming resources."
  type        = string
}

variable "api_gateway_stage_name" {
  description = "The name of your stage"
  type        = string

  # This is what most teams have in their configuration.
  default = "v1"
}
