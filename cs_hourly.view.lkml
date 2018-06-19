view: cs_hourly {
  sql_table_name: PUBLIC.CS_HOURLY ;;

  dimension_group: est {
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
    sql: ${TABLE}."EST_DATE" ;;
  }

  dimension: est_hour {
    type: string
    sql: ${TABLE}."EST_HOUR" ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}."IMPRESSIONS" ;;
  }

  dimension: impressions_dvr {
    type: number
    sql: ${TABLE}."IMPRESSIONS_DVR" ;;
  }

  dimension: impressions_live {
    type: number
    sql: ${TABLE}."IMPRESSIONS_LIVE" ;;
  }

  dimension: orderline {
    type: string
    sql: ${TABLE}."ORDERLINE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
