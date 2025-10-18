
resource "google_pubsub_topic" "topic_tf" {
  
  count = var.configuration.enabled ? 1 : 0

  project = var.project_id
  name    = var.configuration.topic_name
}

resource "google_pubsub_subscription" "sub_tf" {
  count = var.configuration.enabled ? 1 : 0

  project = var.project_id
  name    = var.configuration.subscription_name
  topic   = google_pubsub_topic.topic_tf[0].name

  depends_on = [
    google_pubsub_topic.topic_tf
  ]
}

