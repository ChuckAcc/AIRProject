view: ars_summary {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: Advertiser_Name{
    type: string
    sql: ${TABLE}.Advertiser_Name ;;
   }

  dimension: Agency_Name {
    type: string
    sql: ${TABLE}.Agency_Name ;;
   }

  dimension: IO_ID {
    type: number
    sql: ${TABLE}.IO_ID ;;
  }

  dimension: IO_Name {
    type: string
    sql: ${TABLE}.IO_Name ;;
  }

  dimension_group: Flight_Start_Date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year]
    sql: ${TABLE}.Flight_Start_Date ;;
  }

  dimension_group: Flight_End_Date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year]
    sql: ${TABLE}.Flight_End_Date ;;
  }

  dimension: Deal_ID {
    type: string
    sql: ${TABLE}.Deal_ID ;;
  }

  dimension: Target {
    type: string
    sql: ${TABLE}.Target ;;
  }

  dimension: Universe_Estimate  {
    type: number
    sql: ${TABLE}.Universe_Estimate;;
  }

  dimension: Delivery_Indexed {
    type: number
    sql: ${TABLE}.Delivery_Indexed ;;
  }

  dimension: Reach2  {
    type: number
    sql: ${TABLE}.Reach2  ;;
  }

  dimension: Ordered_Impressions {
    type: number
    sql: ${TABLE}.Ordered_Impressions ;;
  }

  dimension: Delivered_Impressions{
    type: number
    sql: ${TABLE}.Delivered_Impressions ;;
  }

  dimension: Reach {
    type: number
    sql: ${TABLE}.Reach ;;
  }

  dimension: Frequency{
    type: number
    sql: ${TABLE}.Frequency ;;
  }

  measure: Total_Ordered_Impressions {
    type: sum
    sql: ${TABLE}.Ordered_Impressions ;;
  }

  measure: Total_Delivered_Impressions{
    type: sum
    sql: ${TABLE}.Delivered_Impressions ;;
  }
 }
