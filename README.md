# Google Analytics Lake

## How to
### How to create a new Google Analytics Data Mart?

The creation of a new mart will happen in 2 steps:
1. Daily segment generation setup and backfilling
2. Aggregated view (optional)

#### Daily segment generation setup and backfilling

1. Create 1 new file in the `queries/` directory: `{name_of_your_mart}_daily_segments.sql`
2. Replace the `{name_of_your_mart}_daily_segments.sql` content and apply the new logic to create a new daily table at each execution.
3. Update the `config.auto.tfvars` and add the `{name_of_your_mart}` to the `enabled_daily_segment_schedules` list

#### Aggregated view (optional)

1. Create 1 new file in the `queries/` directory: `{name_of_your_mart}_aggregated_view.sql`. ()`{name_of_your_mart}` must be the same as the previous step)
2. Replace the `{name_of_your_mart}_aggregated_view.sql` content and apply the new logic to create the proper view.
3. Update the `config.auto.tfvars` and add the `{name_of_your_mart}` to the `enabled_aggregated_views` list