view: ars_detail {
  sql_table_name: PUBLIC.ARS_DETAIL ;;

########## ID's, Primary Keys ##########

  dimension: deal_id {
    type: string
    sql: ${TABLE}."DEAL_ID" ;;
  }

  dimension: io_id {
    type: number
    sql: ${TABLE}."IO_ID" ;;
  }

  dimension: io_id_custom {
    type: string
    sql: ${TABLE}."IO_ID" ;;
    html:
    {% assign io_id_custom = value | split: "|" %}

    <details>
    <summary>IO's ({{io_id_custom.size}})</summary>

    <ul>
      {% for io in io_id_custom %}
     <li>{{io}}</li>
      {% endfor %}
    </ul>
    </details>
    ;;
  }

  dimension: io_id_custom2 {
    type: string
    sql: LISTAGG(DISTINCT ${TABLE}."IO_ID",'|') ;;
  }



########## Time Dimensions ##########
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

  dimension: time {
    type: date_time
    sql: ${TABLE}."Time" ;;
    html: {{ rendered_value | date: "%r" }};;
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
    drill_fields: [time]
  }

########## Dimensional Attributes ##########

  dimension: io_name {
    type: string
    sql: ${TABLE}."IO_NAME" ;;
  }

 dimension: advertiser_name {
    type: string
    sql: ${TABLE}."ADVERTISER_NAME" ;;
  }

  dimension: agency_name {
    type: string
    sql: ${TABLE}."AGENCY_NAME" ;;
  }

  dimension: type {
    type: string
    case: {
      when: {
        sql: ${TABLE}."Type"='Live';;
        label: "Live"
      }
      when: {
        sql: ${TABLE}."Type"='DVR';;
        label: "DVR"
      }
      when: {
        sql: ${TABLE}."Type"='VOD';;
        label: "VOD"
      }
    }
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

  dimension: frequencyOutlier {
    type: string
    label: "Frequency Outliers"
    sql: CASE
      WHEN ${frequency}>40 THEN 'Yes'
      ELSE NULL
      END;;
  }

########## Impression Information ##########

  dimension: delivered_impressions {
    type: number
    sql: ${TABLE}."DELIVERED_IMPRESSIONS" ;;
  }

  dimension: ordered_impressions {
    type: number
    sql: ${TABLE}."ORDERED_IMPRESSIONS" ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}."FREQUENCY" ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}."REACH" ;;
  }

########## Measures ##########

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
    hidden: yes
    sql:  ${Total_Delivered_Impressions}/${Total_Delivered_Impressions} ;;
    value_format: "0\%"
  }
  measure: Total_Ordered_Impressions{
    type: sum
    sql:  ${TABLE}."ORDERED_IMPRESSIONS" ;;
  }

  measure: Avg_Ordered_Impressions{
    type:average
    hidden: yes
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

  measure: Reach_PercentOfTotal{
    type: percent_of_total
    sql:  ${total_reach} ;;
  }


  ########## Cumulative vs Weekly Toggle - NOT BEING USED ##########

  parameter: impressions_toggle {
    type: string
    allowed_value: {
      label: "Cumulative"
      value: "delivered_impressions_runningTotal"
    }
    allowed_value: {
      label: "Weekly"
      value: "Total_Delivered_Impressions"
    }
  }
  measure: dynamic_impressionsV3 {
    type: number
    label_from_parameter: impressions_toggle
    sql: CASE
            WHEN {% parameter impressions_toggle %} = 'delivered_impressions_runningTotal'
               THEN (${delivered_impressions_runningTotal})
            WHEN {% parameter impressions_toggle %} = 'Total_Delivered_Impressions'
               THEN (${Total_Delivered_Impressions})
            ELSE
               NULL
         END ;;
  }

  ########## Daypart vs Hourly Toggle - NOT BEING USED ##########
  parameter: daypart_vs_hourly {
    type: string
    allowed_value: {
      label: "Show by Daypart"
      value: "daypart"
    }
    allowed_value: {
      label: "Show by Hour"
      value: "Time"
    }
  }

  dimension: daypartHourlyDim {
    type: string
    label_from_parameter: daypart_vs_hourly
    sql: {% if daypart_vs_hourly.parameter_value =="'daypart'" %}
          ${daypart}::VARCHAR
          {% elsif daypart_vs_hourly.parameter_value =="'Time'" %}
          ${time}::VARCHAR
          {% else %}
          NULL
          {% endif %};;
  }

########## Frequency by Range Buckets ##########
  parameter: bucket_1 {
    type: number
  }
  parameter: bucket_2 {
    type: number
  }
  parameter: bucket_3 {
    type: number
  }
  parameter: bucket_4 {
    type: number
  }
  parameter: bucket_5 {
    type: number
  }

  dimension: tier2 {
    type: string
    sql:  CASE
     WHEN ${ars_detail.frequency} <= {% parameter bucket_1 %}
        THEN CONCAT('1-', CAST({% parameter bucket_1 %} as STRING))
      WHEN ${ars_detail.frequency} <= {% parameter bucket_2 %}
        THEN CAST({% parameter bucket_1 %}+1 as STRING) || CONCAT('-', CAST({% parameter bucket_2 %} as STRING))
      WHEN ${ars_detail.frequency} <= {% parameter bucket_3 %}
        THEN CAST({% parameter bucket_2 %}+1 as STRING) || CONCAT('-', CAST({% parameter bucket_3 %} as STRING))
      WHEN ${ars_detail.frequency} <= {% parameter bucket_4 %}
        THEN CAST({% parameter bucket_3 %}+1 as STRING) || CONCAT('-', CAST({% parameter bucket_4 %} as STRING))
      ELSE CONCAT(CAST({% parameter bucket_4 %}+1 as STRING),'+')
      END;;
  }
}
