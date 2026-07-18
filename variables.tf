variable "project_id" {
  description = "ID of the project in which to create the topic."
  type        = string
}

variable "name" {
  description = "Name of the Pub/Sub topic."
  type        = string
}

variable "message_retention_duration" {
  description = "How long to retain unacknowledged messages in the topic, e.g. \"86400s\". Null uses the default."
  type        = string
  default     = null
}

variable "subscriptions" {
  description = "Subscriptions to create on the topic, keyed by subscription name."
  type = map(object({
    ack_deadline_seconds       = optional(number, 10)
    message_retention_duration = optional(string, "604800s")
    retain_acked_messages      = optional(bool, false)
  }))
  default = {}
}

variable "labels" {
  description = "Labels applied to the topic."
  type        = map(string)
  default     = {}
}
