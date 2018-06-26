connection: "air_sandbox_environment"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: air_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: air_project_default_datagroup

explore: cs_hourly {}

explore: cs_network {}

explore: mock_car_data {}

explore: addressable_bob_mockeddata {}
