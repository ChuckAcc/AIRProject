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
    drill_fields: [time]
  }
  dimension: daypart_custom_sort {
    label: "Daypart (Custom Sort)"
    case: {
      when: {
        sql: ${daypart}='6a-8a Early Morning';;
        label: "6a-8a Early Morning"
        }
        when: {
        sql: ${daypart}='8a-4p Day';;
        label: "8a-4p Day"
      }
        when: {
          sql: ${daypart}='4p-8p Fringe';;
          label: "4p-8p Fringe"
        }
        when: {
          sql: ${daypart}='8p-2a Prime';;
          label: "8p-2a Prime"
        }
        when: {
          sql: ${daypart}='2a-6a Overnight';;
          label: "2a-6a Overnight"
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

  dimension: time {
    type: date_time
    sql: ${TABLE}."Time" ;;
  }

  dimension: decileGroup {
    type: string
    sql:  CASE
    WHEN
    ${ars_detail.frequency}<=10 THEN '1-10'
    WHEN
    ${ars_detail.frequency}>=11 AND ${ars_detail.frequency}<=20 THEN '11-20'
    WHEN
    ${ars_detail.frequency}>=21 AND ${ars_detail.frequency}<=30 THEN '21-30'
    WHEN
    ${ars_detail.frequency}>=31 AND ${ars_detail.frequency}<=40 THEN '31-40'
    WHEN
    ${ars_detail.frequency}>=41 AND ${ars_detail.frequency}<=50 THEN '41-50'
    ELSE NULL
    END;;
  }

  measure: count {
    type: count
     }

  measure: Total_Delivered_Impressions{
    type: sum
    sql:  ${TABLE}."DELIVERED_IMPRESSIONS" ;;
    value_format: "#,##0"
  }

  measure: Total_Delivered_ImpressionsPercent{
    type: percent_of_total
    sql:  ${Total_Delivered_Impressions}/${Total_Delivered_Impressions} ;;
    value_format: "0\%"
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

  measure: delivered_impressions_runningTotal{
    type: running_total
    sql:  ${Total_Delivered_Impressions} ;;
    value_format: "#,##0"
  }

  measure: Reach_runningTotal{
    type: running_total
    sql:  ${total_reach} ;;
  }

  measure: Reach_runningTotal_percent{
    type: percent_of_total
    sql:  ${total_reach}" ;;
  }

  dimension: frequencyOutlier {
    type: string
    label: "Frequency Outliers"
    sql: CASE
      WHEN ${frequency}>40 THEN 'Yes'
      ELSE NULL
      END;;
  }



  parameter: impressions_toggle {
    type: unquoted
    allowed_value: {
      label: "Cumulative"
      value: "delivered_impressions_runningTotal"
    }
    allowed_value: {
      label: "Weekly"
      value: "DELIVERED_IMPRESSIONS"
    }
  }

 measure: dynamic_impressionsV2 {
    type: number
    label_from_parameter: impressions_toggle
    sql:
    {% if impressions_toggle._parameter_value == 'DELIVERED_IMPRESSIONS' %}
    ${Total_Delivered_Impressions}
    {% elsif impressions_toggle._parameter_value == 'delivered_impressions_runningTotal' %}
    ${delivered_impressions_runningTotal}
    {% endif %};;
}

measure: dynamic_impressionsV3 {
    type: number
    label_from_parameter: impressions_toggle
    sql: CASE
            WHEN {% parameter impressions_toggle %} = 'Cumulative'
               THEN ${delivered_impressions_runningTotal}
            WHEN {% parameter impressions_toggle %} = 'Weekly'
               THEN ${Total_Delivered_Impressions}
            ELSE
               NULL
         END ;;
}


}
