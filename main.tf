resource "google_pubsub_topic" "this" {
  project                    = var.project_id
  name                       = var.name
  message_retention_duration = var.message_retention_duration
  labels                     = var.labels
}

resource "google_pubsub_subscription" "this" {
  for_each = var.subscriptions

  project                    = var.project_id
  name                       = each.key
  topic                      = google_pubsub_topic.this.id
  ack_deadline_seconds       = each.value.ack_deadline_seconds
  message_retention_duration = each.value.message_retention_duration
  retain_acked_messages      = each.value.retain_acked_messages
}
