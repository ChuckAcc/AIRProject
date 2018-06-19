view: mock_car_data {
  sql_table_name: PUBLIC.MOCK_CAR_DATA ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: car_color {
    type: string
    sql: ${TABLE}."CAR_COLOR" ;;
  }

  dimension: car_make {
    type: string
    sql: ${TABLE}."CAR_MAKE" ;;
  }

  dimension: car_model {
    type: string
    sql: ${TABLE}."CAR_MODEL" ;;
  }

  dimension: car_model_year {
    type: number
    sql: ${TABLE}."CAR_MODEL_YEAR" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }
}
