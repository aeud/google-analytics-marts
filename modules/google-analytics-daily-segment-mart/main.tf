resource "google_bigquery_data_transfer_config" "mart_daily_segments" {
  display_name           = var.mart_name
  location               = var.region
  data_source_id         = "scheduled_query"
  schedule               = "every day 14:00"
  service_account_name   = var.service_account_email
  destination_dataset_id = var.destination_dataset_id
  params = {
    destination_table_name_template = "${var.mart_name}_{run_time-24h|\"%Y%m%d\"}"
    write_disposition               = "WRITE_TRUNCATE"
    query                           = templatefile("${path.module}/../../queries/${var.mart_name}_daily_segments.sql", {
        project = var.google_analytics_dataset_project_id,
        dataset = "analytics_${var.google_analytics_property_id}",
    })
  }
}