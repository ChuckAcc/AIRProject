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
    link: {
      label: "{{value}} Daily Impressions"
      url: "/dashboards/49?Channel"

     # /dashboards/thelook::channel_analytics?Channel%20Name={{ value | encode_uri }}"
      #icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: orderline {
    type: string
    sql: ${TABLE}."ORDERLINE" ;;
  }

  measure: Total_Impressions {
    type: sum
    drill_fields: []
    sql: (${TABLE}."IMPRESSIONS");;
  }

  measure: Total_DVR_Impressions {
    type: sum
    drill_fields: []
    sql: (${TABLE}."IMPRESSIONS_DVR");;
  }

  measure: Total_Live_Impressions {
    type: sum
    drill_fields: []
    sql: (${TABLE}."IMPRESSIONS_LIVE");;
  }
}
