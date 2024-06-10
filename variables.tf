variable "project_id" {
    type = string
}
variable "region" {
    type = string
    default = "US"
}
variable "google_analytics_dataset_project_id" {
    type = string
}
variable "google_analytics_property_id" {
    type = string
}
variable "destination_dataset_name" {
    type = string
}
variable "enabled_daily_segment_schedules" {
    type = list(string)
    default = [
        "topline_metrics",
        "page_value",
    ]
}
variable "enabled_aggregated_views" {
    type = list(string)
    default = [
        "topline_metrics",
    ]
}