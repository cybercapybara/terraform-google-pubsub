# terraform-google-pubsub

Terraform module that manages a [Google Cloud](https://cloud.google.com/)
Pub/Sub topic (`google_pubsub_topic`) and an optional set of subscriptions
driven by a map input.

## Usage

```hcl
module "pubsub" {
  source = "github.com/moveeeax/terraform-google-pubsub"

  project_id = var.project_id
  name       = "events"

  subscriptions = {
    "events-worker" = {
      ack_deadline_seconds = 30
    }
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| google    | >= 5.0   |

## Inputs

| Name                         | Description                                              | Type          | Default | Required |
|------------------------------|----------------------------------------------------------|---------------|---------|:--------:|
| `project_id`                 | ID of the project in which to create the topic.          | `string`      | n/a     |   yes    |
| `name`                       | Name of the Pub/Sub topic.                               | `string`      | n/a     |   yes    |
| `message_retention_duration` | How long to retain unacknowledged messages.              | `string`      | `null`  |    no    |
| `subscriptions`              | Subscriptions keyed by name.                             | `map(object)` | `{}`    |    no    |
| `labels`                     | Labels applied to the topic.                             | `map(string)` | `{}`    |    no    |

## Outputs

| Name               | Description                                       |
|--------------------|---------------------------------------------------|
| `id`               | Identifier of the Pub/Sub topic.                 |
| `name`             | Name of the Pub/Sub topic.                       |
| `subscription_ids` | Identifiers of the subscriptions created.        |

## License

[MIT](LICENSE)
