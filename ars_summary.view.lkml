view: ars_summary {
  sql_table_name: PUBLIC.ARS_SUMMARY ;;

########## ID's, Primary Keys ##########

  dimension: IO_ID {
    primary_key:yes
    type: number
    sql: ${TABLE}.IO_ID;;
  }

  dimension: io_id_custom2 {
    type: string
    label: "Insertion Order ID"
    sql: LISTAGG(DISTINCT ${TABLE}."IO_ID",', ') ;;
  }

  dimension: Deal_ID {
    type: string
    sql: ${TABLE}.Deal_ID ;;
    # drill_fields: [IO_ID]
  }


########## Date/Time Dimensions ##########

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

  dimension: flight_concat {
    type: string
    label: "Flight"
    sql:  ${TABLE}."Flight_Concat";;
  }

  dimension: Last_Update_Dt{
    type: date
    label: "Data Last Updated:"
    sql: ${TABLE}."Last Update Date" ;;
  }

########## Dimensional Attributes ##########

  dimension: Advertiser_Name{
    type: string
    sql: ${TABLE}.Advertiser_Name ;;
  }

  dimension: Agency_Name {
    type: string
    sql: ${TABLE}.Agency_Name ;;
  }

  dimension: IO_Name {
    type: string
    sql: ${TABLE}.IO_Name ;;
  }

  dimension: Target {
    type: string
    sql: ${TABLE}.Target ;;
  }

########## Information Section Custom Attributes ##########

  dimension: Advertiser_Name2{
    type: string
    label: "Deal Advertiser"
    #hidden:  yes
    sql: LISTAGG(DISTINCT ${TABLE}.Advertiser_Name,', ');;
  }

  dimension: Agency_Name2 {
    type: string
    label: "Deal Agency"
    #hidden:  yes
    sql: LISTAGG(DISTINCT ${TABLE}.Agency_Name,', ') ;;
  }

  dimension: IO_Name2 {
    type: string
    label: "Insertion Order Name"
    #hidden:  yes
    sql: LISTAGG(DISTINCT ${TABLE}.IO_Name,', ') ;;
  }

  dimension: Deal_ID2 {
    type: string
    label: "Deal ID"
    #hidden:  yes
    sql: LISTAGG(DISTINCT ${TABLE}.Deal_ID,', ') ;;
  }

  dimension: Target2 {
    type: string
    label: "Targeting"
    #hidden:  yes
    sql: LISTAGG(DISTINCT ${TABLE}.Target,', ') ;;
  }

  dimension: flight_concat2 {
    type: string
    label: "Deal Flight Period"
    #hidden:  yes
    sql:  LISTAGG(DISTINCT ${TABLE}."Flight_Concat",', ');;
  }

  dimension: flight_concat3 {
    type: string
    label: "Insertion Order Flight Period"
    #hidden:  yes
    sql:  LISTAGG(DISTINCT ${TABLE}."Flight_Concat",', ');;
  }

########## Impression Information ##########

  dimension: Universe_Estimate{
    type: number
    label: "Target Universe"
    sql: ${TABLE}."Universe_Estimate ";;
  }

  dimension: Delivery_Indexed {
    type: number
    value_format: "0\%"
    label: "Delivery Indexed to Booked Impressions"
    sql: ${TABLE}.Delivery_Indexed ;;
  }

  dimension: Reach2{
    type: number
    value_format: "0\%"
    label: "Reach"
    sql: ${TABLE}."Reach2"  ;;
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

  ########## Measures ##########

  measure: Total_Ordered_Impressions {
    type: sum_distinct
    sql: ${TABLE}.Ordered_Impressions ;;
  }

  measure: Total_Delivered_Impressions{
    type: sum_distinct
    sql: ${TABLE}.Delivered_Impressions ;;
  }

  measure: Total_Reach{
    type: sum
    sql: ${TABLE}.Reach ;;
  }

  measure: Total_Target_Est{
    type: sum
    sql: ${TABLE}."Universe_Estimate " ;;
  }
 }
