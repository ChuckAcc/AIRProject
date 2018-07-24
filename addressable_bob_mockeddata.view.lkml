view: addressable_bob_mockeddata {
  sql_table_name: PUBLIC.ADDRESSABLE_BOB_MOCKEDDATA ;;

  dimension: ad_id {
    type: string
    sql: ${TABLE}."AD_ID" ;;
  }

  dimension: advertiser_industry_name {
    type: string
    sql: ${TABLE}."ADVERTISER_INDUSTRY_NAME" ;;
  }

  dimension: contract_units {
    type: number
    sql: ${TABLE}."CONTRACT_UNITS" ;;
  }

  dimension: creative_format {
    type: string
    sql: ${TABLE}."CREATIVE_FORMAT" ;;
  }

  dimension: creative_size {
    type: string
    sql: ${TABLE}."CREATIVE_SIZE" ;;
  }

  dimension: current_revenue_owner_name {
    type: string
    sql: ${TABLE}."CURRENT_REVENUE_OWNER_NAME" ;;
  }

  dimension: daypart_selection {
    type: string
    sql: ${TABLE}."DAYPART_SELECTION" ;;
  }

  dimension: deal_advertiser_name {
    type: string
    sql: ${TABLE}."DEAL_ADVERTISER_NAME" ;;
  }

  dimension: deal_billable_revenue {
    type: string
    sql: ${TABLE}."DEAL_BILLABLE_REVENUE" ;;
  }

  dimension: deal_billing_agency_commission_pct {
    type: number
    sql: ${TABLE}."DEAL_BILLING_AGENCY_COMMISSION_PCT" ;;
  }

  dimension: deal_buying_agency_name {
    type: string
    sql: ${TABLE}."DEAL_BUYING_AGENCY_NAME" ;;
  }

  dimension_group: deal_flight_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DEAL_FLIGHT_END_DATE" ;;
  }

  dimension_group: deal_flight_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DEAL_FLIGHT_START_DATE" ;;
  }

  dimension: deal_id {
    type: string
    sql: ${TABLE}."DEAL_ID" ;;
    drill_fields: [io_id, line_id]
  }

  dimension: deal_likelihood_pct {
    type: number
    sql: ${TABLE}."DEAL_LIKELIHOOD_PCT" ;;
  }

  dimension: deal_name {
    type: string
    sql: ${TABLE}."DEAL_NAME" ;;
  }

  dimension: deal_type {
    type: string
    sql: ${TABLE}."DEAL_TYPE" ;;
  }

  dimension: delivered_units {
    type: number
    sql: ${TABLE}."DELIVERED_UNITS" ;;
  }

  dimension: excluded_networks {
    type: string
    sql: ${TABLE}."EXCLUDED_NETWORKS" ;;
  }

  dimension: excluded_ratings {
    type: string
    sql: ${TABLE}."EXCLUDED_RATINGS" ;;
  }

  dimension: external_line_id {
    type: number
    sql: ${TABLE}."EXTERNAL_LINE_ID" ;;
  }

  dimension: frequency_capping {
    type: string
    sql: ${TABLE}."FREQUENCY_CAPPING" ;;
  }

  dimension: gross_contract_value {
    type: number
    sql: ${TABLE}."GROSS_CONTRACT_VALUE" ;;
  }

  dimension: households {
    type: number
    sql: ${TABLE}."HOUSEHOLDS" ;;
  }

  dimension: included_ratings {
    type: string
    sql: ${TABLE}."INCLUDED_RATINGS" ;;
  }

  dimension: insertion_order_name {
    type: string
    sql: ${TABLE}."INSERTION_ORDER_NAME" ;;
  }

  dimension: invidi_io_id {
    type: number
    sql: ${TABLE}."INVIDI_IO_ID" ;;
  }

  dimension_group: io_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."IO_END_DATE" ;;
  }

  dimension: io_id {
    type: number
    sql: ${TABLE}."IO_ID" ;;
  }

  dimension_group: io_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."IO_START_DATE" ;;
  }

  dimension: io_status {
    type: string
    sql: ${TABLE}."IO_STATUS" ;;
  }

  dimension: line_contract_price {
    type: number
    sql: ${TABLE}."LINE_CONTRACT_PRICE" ;;
  }

  dimension_group: line_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LINE_END_DATE" ;;
  }

  dimension: line_id {
    type: string
    sql: ${TABLE}."LINE_ID" ;;
  }

  dimension: line_name {
    type: string
    sql: ${TABLE}."LINE_NAME" ;;
  }

  dimension: line_product_name {
    type: string
    sql: ${TABLE}."LINE_PRODUCT_NAME" ;;
  }

  dimension_group: line_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LINE_START_DATE" ;;
  }

  dimension: line_status {
    type: string
    sql: ${TABLE}."LINE_STATUS" ;;
  }

  dimension: metric {
    type: string
    sql: ${TABLE}."METRIC" ;;
  }

  dimension: net_contract_value {
    type: number
    sql: ${TABLE}."NET_CONTRACT_VALUE" ;;
  }

  dimension: primary_proposal_ind {
    type: string
    sql: ${TABLE}."PRIMARY_PROPOSAL_IND" ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}."PRIORITY" ;;
  }

  dimension: proposal_id {
    type: string
    sql: ${TABLE}."PROPOSAL_ID" ;;
  }

  dimension: sales_planner {
    type: string
    sql: ${TABLE}."SALES_PLANNER" ;;
  }

  dimension: seperation {
    type: string
    sql: ${TABLE}."SEPERATION" ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}."STAGE" ;;
  }

  dimension: suggested_price {
    type: number
    sql: ${TABLE}."SUGGESTED_PRICE" ;;
  }

  dimension: targeting {
    type: string
    sql: ${TABLE}."TARGETING" ;;
  }

  dimension: unit_type {
    type: string
    sql: ${TABLE}."UNIT_TYPE" ;;
  }

  dimension: dayparts {
    type: string
    sql: ${TABLE}."Dayparts" ;;
  }

  dimension: deal_status {
    type: string
    sql: ${TABLE}."Deal Status" ;;
  }

  dimension: revenue_category_name {
    type: string
    sql: ${TABLE}."Revenue Category Name" ;;
  }

  dimension: network_type {
    type: string
    sql: ${TABLE}."Network Type" ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}."Network" ;;
  }

  dimension: marketplace {
    type: string
    sql: ${TABLE}."Marketplace" ;;
  }

  dimension: inventory_type {
    type: string
    sql: ${TABLE}."Inventory Type" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_unit_price{
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}."LINE_CONTRACT_PRICE" * ${TABLE}."CONTRACT_UNITS" ;;
    value_format: "$#,##0.00"
  }

  measure: total_suggested_price{
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}."SUGGESTED_PRICE"* ${TABLE}."CONTRACT_UNITS" ;;
    value_format: "$#,##0.00"
  }


  measure: avg_creative_size{
    type: average
    drill_fields: [detail*]
    sql: ${TABLE}."CREATIVE_SIZE" ;;
  }

  measure: total_contract_units{
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}."CONTRACT_UNITS" ;;
    value_format: "#,##0"
  }

  measure: total_gross_contract_value{
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}."GROSS_CONTRACT_VALUE" ;;
    value_format: "$#,##0.00"
  }
  measure: total_net_contract_value{
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}."NET_CONTRACT_VALUE" ;;
    value_format: "$#,##0.00"
  }

  measure: total_delivered_units{
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}."DELIVERED_UNITS" ;;
    value_format: "#,##0"
  }
  parameter: max_rank {
    type: number
  }

  dimension: rank_limit {
    type: number
    sql: {% parameter max_rank %} ;;
  }

  parameter: dimension_to_aggregate {
    type: unquoted
    allowed_value: {
      label: "Net Revenue"
      value: "NET_CONTRACT_VALUE"
    }
    allowed_value: {
      label: "Gross Revenue"
      value: "GROSS_CONTRACT_VALUE"
    }
  }

  measure: dynamic_revenue {
    type: number
    label_from_parameter: dimension_to_aggregate
    sql: sum( ${TABLE}.{% parameter dimension_to_aggregate %});;
    value_format: "$#,##0.00"
  }

  parameter: date_selector {
    type: string
    allowed_value: {
      label: "Quarter"
      value: "quarter"
    }
    allowed_value: {
      label: "Month"
      value: "month"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
    default_value: "Month"
  }

  dimension: dynamic_timeframe {
    type: date_time
    sql: DATE_TRUNC({% parameter date_selector %}, CONVERT_TIMEZONE('UTC', 'America/New_York', ${deal_flight_start_date})) ;;
    label: "Deal Start Date"
    convert_tz: no
  }

  dimension: dynamic_timeframe2{
    type: string
    sql:    CASE
        WHEN {% condition date_selector %} 'Quarter' {% endcondition %} THEN CAST(${deal_flight_start_quarter} AS varchar(120))
        WHEN {% condition date_selector %} 'Month' {% endcondition %} THEN CAST(${deal_flight_start_month} AS varchar(120))
        WHEN {% condition date_selector %} 'Week' {% endcondition %} THEN CAST(${deal_flight_start_week} AS varchar(120))
        END ;;
}

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      creative_format,
      deal_id,
      current_revenue_owner_name,
      deal_type,
      deal_buying_agency_name,
      deal_advertiser_name,
      line_product_name,
      advertiser_industry_name,
      deal_name,
      deal_flight_start_date,
      deal_flight_end_date,
      creative_size,
      contract_units,
      gross_contract_value,
      net_contract_value

    ]
  }
}
