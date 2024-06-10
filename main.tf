provider "google" {
    project     = var.project_id
}

data "google_project" "project" {}

resource "google_service_account" "ga_marts_agent" {
    account_id   = "google-analytics-marts-agent"
}
resource "google_project_iam_member" "grant_bigquery_user" {
    project = var.project_id
    role    = "roles/bigquery.user"
    member  = google_service_account.ga_marts_agent.member
}
resource "google_bigquery_dataset_iam_member" "grant_bigquery_destination_dataset_editor" {
    dataset_id = google_bigquery_dataset.ga_dataset.dataset_id
    role       = "roles/bigquery.dataEditor"
    member     = google_service_account.ga_marts_agent.member
}
resource "google_bigquery_dataset_iam_member" "grant_bigquery_destination_dataset_us_editor" {
    dataset_id = google_bigquery_dataset.ga_dataset_us.dataset_id
    role       = "roles/bigquery.dataEditor"
    member     = google_service_account.ga_marts_agent.member
}
resource "google_bigquery_dataset_iam_member" "grant_bigquery_source_dataset_viewer" {
    project    = var.google_analytics_dataset_project_id
    dataset_id = "analytics_${var.google_analytics_property_id}"
    role       = "roles/bigquery.dataViewer"
    member     = google_service_account.ga_marts_agent.member
}

resource "google_bigquery_dataset" "ga_dataset" {
    dataset_id                  = var.destination_dataset_name
    location                    = var.region
}
resource "google_bigquery_dataset" "ga_dataset_us" {
    dataset_id                  = "ae_demo_ga_us"
    location                    = "US"
}

resource "google_project_iam_member" "permissions" {
    project = data.google_project.project.project_id
    role   = "roles/iam.serviceAccountTokenCreator"
    member = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"
}