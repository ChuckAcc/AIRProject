view: ars_detail_weekly_rollup {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'ars_detail.date_week'

      select
        "DATE",
        WEEK("DATE") || YEAR("DATE") as weekyear,
        delivered_impressions,
        sum(DELIVERED_IMPRESSIONS) OVER(PARTITION BY weekyear ORDER BY weekyear rows between unbounded preceding and current row) as running_total_by_week_delivered,
        sum(DELIVERED_IMPRESSIONS) OVER(PARTITION BY weekyear ORDER BY weekyear) as cum_total_by_week_delivered,
        ordered_impressions,
        sum(ORDERED_IMPRESSIONS) OVER(PARTITION BY weekyear ORDER BY weekyear rows between unbounded preceding and current row) as running_total_by_week_ordered,
        sum(ORDERED_IMPRESSIONS) OVER(PARTITION BY weekyear ORDER BY weekyear) as cum_total_by_week_ordered
      from ARS_DETAIL
      ORDER BY 1 ASC
       ;;
    #persist_for: "24 hours"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}."DATE" ;;
    timeframes: [raw,date,time,week,month,quarter,year]
  }

  dimension: weekyear {
    type: string
    sql: ${TABLE}."WEEKYEAR" ;;
  }

  dimension: delivered_impressions {
    type: number
    sql: ${TABLE}."DELIVERED_IMPRESSIONS" ;;
  }

  dimension: running_total_delivered {
    type: number
    hidden: yes
    sql: ${TABLE}."RUNNING_TOTAL_BY_WEEK_DELIVERED" ;;
  }

  dimension: cum_total_delivered {
    type: number
    hidden: yes
    sql: ${TABLE}."CUM_TOTAL_BY_WEEK_DELIVERED" ;;
  }

  dimension: ordered_impressions {
    type: number
    sql: ${TABLE}."ORDERED_IMPRESSIONS" ;;
  }

  dimension: running_total_ordered {
    type: number
    hidden: yes
    sql: ${TABLE}."RUNNING_TOTAL_BY_WEEK_ORDERED" ;;
  }

  dimension: cum_total_ordered {
    type: number
    hidden: yes
    sql: ${TABLE}."CUM_TOTAL_BY_WEEK_ORDERED" ;;
  }

  measure: running_total_by_week_delivered {
    type: number
    sql:  ${running_total_delivered};;
    drill_fields: [detail*]
  }

  measure: running_total_by_week_ordered {
    type: number
    sql: ${running_total_ordered} ;;
    drill_fields: [detail*]
  }

  measure: weekly_total_ordered {
    type: number
    sql: ${cum_total_ordered} ;;
  }

  measure: weekly_total_delivered {
    type: number
    sql: ${cum_total_delivered} ;;
  }

  parameter: impressions_toggle {
    type: string
    allowed_value: {
      label: "Cumulative"
      value: "running_total"
    }
    allowed_value: {
      label: "Weekly"
      value: "total"
    }
    default_value: "total"
  }

  parameter: metrics_toggle {
    type: string
    allowed_value: {
      label: "Ordered Impressions"
      value: "ordered"
    }
    allowed_value: {
      label: "Delivered Impressions"
      value: "delivered"
    }
    default_value: "delivered"
  }

  dimension: selected_value {
    type: number
    label_from_parameter: metrics_toggle
    sql:  CASE
            WHEN {% parameter impressions_toggle %} = 'running_total' AND {% parameter metrics_toggle %} = 'delivered'
              THEN ${running_total_delivered}
            WHEN {% parameter impressions_toggle %} = 'running_total' AND {% parameter metrics_toggle %} = 'ordered'
              THEN ${running_total_ordered}
            WHEN {% parameter impressions_toggle %} = 'total' AND {% parameter metrics_toggle %} = 'delivered'
              THEN ${cum_total_delivered}
            WHEN {% parameter impressions_toggle %} = 'total' AND {% parameter metrics_toggle %} = 'ordered'
              THEN ${cum_total_ordered}
            ELSE NULL
          END ;;
  }



  set: detail {
    fields: [
      date_date,
      weekyear,
      delivered_impressions,
      ordered_impressions
    ]
  }
}
