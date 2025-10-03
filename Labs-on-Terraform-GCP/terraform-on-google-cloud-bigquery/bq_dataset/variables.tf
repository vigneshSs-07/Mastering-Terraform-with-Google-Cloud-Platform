
# ================================================================================
# VARIABLES
# ================================================================================

variable "project_id" {
  description = "The ID of the Google Cloud project where resources will be created."
  type        = string
  validation {
    condition     = length(var.project_id) > 6
    error_message = "The project_id must be at least 6 characters long."
  }
  default = "myorg-cloudai-gcp1722"
}

variable "region" {
  description = "The GCP region for resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone for resources"
  type        = string
  default     = "us-central1-b"
}

variable "cost_center" {
  description = "Cost center for resources"
  type        = number
  default     = 1707224
}

variable "environment" {
  description = "The environment to which the resources are deployed (e.g., 'dev', 'staging', 'prod')."
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "The team or individual responsible for managing the resources."
  type        = string
  default     = "data-engineering-team"
}


variable "user_by_email" {
  description = "The email address of the user who will be granted specific permissions on the BigQuery dataset."
  type        = string
  default     = "cloudaianalytics@gmail.com"
}

variable "data_classification" {
  description = "Classification level of the data stored in the BigQuery dataset (e.g., 'internal', 'confidential', 'public')."
  type        = string
  validation {
    condition     = contains(["internal", "confidential", "public"], var.data_classification)
    error_message = "The data_classification must be one of 'internal', 'confidential', or 'public'."
  }
  default = "internal"
}

variable "backup_required" {
  description = "Indicates whether backups are required for the BigQuery dataset."
  type        = bool
  default     = true
}

variable "compliance" {
  description = "Compliance standard(s) that the BigQuery dataset adheres to (e.g., 'gdpr-compliant', 'hipaa-compliant')."
  type        = string
  default     = "gdpr-compliant"
}

variable "created_by" {
  description = "The tool or system used to create the resources (e.g., 'terraform-core')."
  type        = string
  default     = "terraform-core"
}

variable "managed_by" {
  description = "The team responsible for managing the infrastructure (e.g., 'infrastructure-team')."
  type        = string
  default     = "infrastructure-team"
}

variable "resource_tags" {
  description = "A map of additional string-to-string tags to apply to the resources."
  type        = map(string)
  default     = {}
}
