output "id" {
  description = "Identifier of the Pub/Sub topic."
  value       = google_pubsub_topic.this.id
}

output "name" {
  description = "Name of the Pub/Sub topic."
  value       = google_pubsub_topic.this.name
}

output "subscription_ids" {
  description = "Identifiers of the subscriptions created on the topic."
  value       = { for k, s in google_pubsub_subscription.this : k => s.id }
}
