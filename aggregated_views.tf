module "aggregated_views" {
    for_each = toset(var.enabled_aggregated_views)
    source = "./modules/google-analytics-aggregated-view"
    mart_name = each.key
    destination_dataset_id = google_bigquery_dataset.ga_dataset.dataset_id
    project_id = var.project_id
    region = var.region
    depends_on = [
        google_project_iam_member.permissions,
        google_service_account.ga_marts_agent,
        google_bigquery_dataset_iam_member.grant_bigquery_destination_dataset_editor,
    ]
}