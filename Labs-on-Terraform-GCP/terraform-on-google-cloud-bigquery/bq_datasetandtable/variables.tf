
# ================================================================================
# VARIABLES
# ================================================================================

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region for resources"
  type        = string
}

variable "zone" {
  description = "The GCP zone for resources"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "owner" {
  description = "Resource owner"
  type        = string
}


variable "user_by_email" {
  description = "The user email"
  type        = string
}


variable "sec_user_by_email" {
  description = "The user email"
  type        = string
}

variable "dataset_id" {
  description = "The user email"
  type        = string
}

variable "table_id" {
  description = "The user email"
  type        = string
}

variable "partioning_keys" {
  description = "The user email"
  type        = string
}

variable "table_clustering_keys" {
  description = "A list of columns to cluster the BigQuery table by."
  type        = list(string)
}