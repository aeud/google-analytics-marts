resource "google_bigquery_table" "mart_aggreagated_view" {
  dataset_id = var.destination_dataset_id
  table_id   = var.mart_name
  view {
    query = templatefile("${path.module}/../../queries/${var.mart_name}_aggregated_view.sql", {
        project = var.project_id,
        dataset = var.destination_dataset_id,
        table_prefix = var.mart_name
    })
    use_legacy_sql = false
  }
  deletion_protection=false
}