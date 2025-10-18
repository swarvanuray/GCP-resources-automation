# The outputs are also updated to reference the new configuration variable.

output "pubsub_topic_id" {
  description = "The full ID of the created Pub/Sub topic."
  value       = var.configuration.enabled ? google_pubsub_topic.topic_tf[0].id : "Pub/Sub topic was not created."
}

output "pubsub_subscription_id" {
  description = "The full ID of the created Pub/Sub subscription."
  value       = var.configuration.enabled ? google_pubsub_subscription.sub_tf[0].id : "Pub/Sub subscription was not created."
}

