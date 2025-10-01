
# ================================================================================
# VARIABLES
# ================================================================================

variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "myorg-cloudai-gcp1722"
}

variable "region" {
  description = "The GCP region for resources"
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  description = "The GCP zone for resources"
  type        = string
  default     = "europe-west1-b"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Resource owner"
  type        = string
  default     = "data-engineering-team"
}


variable "user_by_email" {
  description = "The user email"
  type        = string
  default     = "cloudaianalytics@gmail.com"
}