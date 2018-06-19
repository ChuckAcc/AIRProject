view: cs_network {
  sql_table_name: PUBLIC.CS_NETWORK ;;

  dimension_group: est_broadcast {
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
    sql: ${TABLE}."EST_BROADCAST_DATE" ;;
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

  dimension: network {
    type: string
    sql: ${TABLE}."NETWORK" ;;
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
