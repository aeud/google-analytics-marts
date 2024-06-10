select sum_1
    , parse_date("%Y%m%d", _table_suffix) as `partition_date`
from `${project}.${dataset}.${table_prefix}_*`