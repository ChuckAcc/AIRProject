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

explore: cs_hourly {
  label: "CS Hourly Impressions"
}

explore: cs_network {
  label: "CS Network Impressions"
}

explore: mock_car_data {}

explore: addressable_bob_mockeddata {
  label: "Book of Business"
}

explore: ars_summary {
  label: "ARS Summary"
  #hidden: yes
  cancel_grouping_fields: [ars_summary.io_id_custom2, ars_summary.Agency_Name2, ars_summary.Advertiser_Name2, ars_summary.Deal_ID2]
}

explore: ars_detail {
  label: "ARS Detail"
  cancel_grouping_fields: [ars_detail.io_id_custom2]
}
