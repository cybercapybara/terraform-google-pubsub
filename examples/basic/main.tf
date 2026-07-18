terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "pubsub" {
  source = "../.."

  project_id = var.project_id
  name       = "example-topic"

  subscriptions = {
    "example-sub" = {
      ack_deadline_seconds = 20
    }
  }
}

variable "project_id" {
  description = "Project ID to deploy the example topic into."
  type        = string
}

variable "region" {
  description = "Region for the google provider."
  type        = string
  default     = "us-central1"
}

output "topic_id" {
  value = module.pubsub.id
}
