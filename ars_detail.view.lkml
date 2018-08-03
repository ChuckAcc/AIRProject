view: ars_detail {
  sql_table_name: PUBLIC.ARS_DETAIL ;;

  dimension: advertiser_name {
    type: string
    sql: ${TABLE}."ADVERTISER_NAME" ;;
  }

  dimension: agency_name {
    type: string
    sql: ${TABLE}."AGENCY_NAME" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}."DATE" ;;
  }

  dimension: daypart {
    type: string
    sql: ${TABLE}."DAYPART" ;;
  }
  dimension: daypart_custom_sort {
    label: "Daypart Custom Sort"
    case: {
      when: {
        sql: ${TABLE}."DAYPART"='6a-8a Early Morning';;
        }
        when: {
        sql: ${TABLE}."DAYPART"='8a-4p Day';;
      }
        when: {
          sql: ${TABLE}."DAYPART"='4p-8p Fringe';;
        }
        when: {
          sql: ${TABLE}."DAYPART"='8p-2a Prime';;
        }
        when: {
          sql: ${TABLE}."DAYPART"='2a-6a Overnight';;
        }
  }
}

  dimension: deal_id {
    type: string
    sql: ${TABLE}."DEAL_ID" ;;
  }

  dimension: delivered_impressions {
    type: number
    sql: ${TABLE}."DELIVERED_IMPRESSIONS" ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}."FREQUENCY" ;;
  }

  dimension: io_id {
    type: number
    sql: ${TABLE}."IO_ID" ;;
  }

  dimension: io_name {
    type: string
    sql: ${TABLE}."IO_NAME" ;;
  }

  dimension: ordered_impressions {
    type: number
    sql: ${TABLE}."ORDERED_IMPRESSIONS" ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}."REACH" ;;
  }

 dimension: type {
    type: string
    sql: ${TABLE}."Type" ;;
  }

  measure: count {
    type: count
     }

  measure: Total_Delivered_Impressions{
    type: sum
    sql:  ${TABLE}."DELIVERED_IMPRESSIONS" ;;
  }

  measure: Total_Ordered_Impressions{
    type: sum
    sql:  ${TABLE}."ORDERED_IMPRESSIONS" ;;
  }

  measure: avg_Frequency{
    type: average
    sql:  ${TABLE}."FREQUENCY"  ;;
  }
  measure: total_reach{
    type: sum
    sql:  ${TABLE}."REACH"  ;;
  }

}
