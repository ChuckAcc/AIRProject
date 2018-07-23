connection: "air_sandbox_environment"

# include all the views
include: "*.view"

# include all the dashboards
#include: "*.dashboard"

datagroup: air_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: air_project_default_datagroup

explore: cs_hourly {}

explore: cs_network {}

explore: mock_car_data {}

explore: addressable_bob_mockeddata {
  sql_preamble: CREATE FUNCTION date_to_string (VARCHAR, DATETIME)
RETURNS VARCHAR
 STABLE
AS $$
  SELECT
  CASE
    WHEN LOWER($1) IN ('year') THEN TO_CHAR($2, 'YYYY')
    WHEN LOWER($1) IN ('quarter', 'month') THEN TO_CHAR($2, 'YYYY-MM')
    WHEN LOWER($1) IN ('week', 'day') THEN TO_CHAR($2, 'YYYY-MM-DD')
    WHEN LOWER($1) IN ('hour', 'minute') THEN TO_CHAR($2, 'YYYY-MM-DD HH24:MI')
  END
$$ LANGUAGE sql;;
}
