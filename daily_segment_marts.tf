module "daily_segment_marts" {
    for_each = toset(var.enabled_daily_segment_schedules)
    source = "./modules/google-analytics-daily-segment-mart"
    mart_name = each.key
    service_account_email = google_service_account.ga_marts_agent.email
    destination_dataset_id = google_bigquery_dataset.ga_dataset.dataset_id
    google_analytics_dataset_project_id = var.google_analytics_dataset_project_id
    google_analytics_property_id = var.google_analytics_property_id
    project_id = var.project_id
    region = var.region
    depends_on = [
        google_project_iam_member.permissions,
        google_service_account.ga_marts_agent,
        google_bigquery_dataset_iam_member.grant_bigquery_destination_dataset_editor,
    ]
}