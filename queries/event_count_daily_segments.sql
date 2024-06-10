select sum(1) as sum_1
    -- etc.
from `${project}.${dataset}.events_*`
where _table_suffix = format_date("%Y%m%d", date_sub(@run_date, interval 1 day))