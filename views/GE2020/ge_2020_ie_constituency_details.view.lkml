view: ge_2020_ie_constituency_details {
  sql_table_name: `{{ _user_attributes['db_project'] }}.{{ _user_attributes['database'] }}.GE_2020_IE_Constituency_Details`
    ;;
    view_label: "Constituency"

  dimension: constituency_ainm {
    type: string
    sql: ${TABLE}.Constituency_Ainm ;;
  }

  dimension: constituency_name {
    type: string
    sql: ${TABLE}.Constituency_Name ;;
    map_layer_name: irish_dail
  }

  dimension: constituency_number {
    primary_key: yes
    type: number
    sql: ${TABLE}.Constituency_Number ;;
  }

  dimension: count_number {
    type: number
    sql: ${TABLE}.Count_Number ;;
  }

  dimension_group: date_of_election {
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
    sql: ${TABLE}.Date_Of_Election ;;
  }

  dimension: number_of_candidates {
    type: number
    sql: ${TABLE}.Number_Of_Candidates ;;
  }

  dimension: number_of_seats {
    type: number
    sql: ${TABLE}.Number_of_Seats ;;
  }

  dimension: quota {
    type: number
    sql: ${TABLE}.Quota ;;
  }

  dimension: required_save_deposit {
    type: number
    sql: ${TABLE}.Required_Save_Deposit ;;
  }

  dimension: seats_filled {
    type: number
    sql: ${TABLE}.Seats_Filled ;;
  }

  dimension: seatsin_constit {
    type: number
    sql: ${TABLE}.SeatsinConstit ;;
  }

  dimension: spoiled {
    type: number
    sql: ${TABLE}.Spoiled ;;
  }

  dimension: electorate {
    hidden: yes
    type: number
    sql: ${TABLE}.Total_Electorate ;;
  }

  dimension: poll {
    type: number
    sql: ${TABLE}.Total_Poll ;;
  }

  dimension: valid_poll {
    type: number
    sql: ${TABLE}.Valid_Poll ;;
  }

  measure: count {
    type: count
    drill_fields: [constituency_name]
  }

  measure: total_electorate {
    type: sum
    sql: ${electorate} ;;
  }

  measure: total_poll {
    type: sum
    sql: ${poll} ;;
  }

  measure: turnout {
    type: number
    sql: 1.00*(${total_poll}/nullif(${total_electorate},0)) ;;
    value_format_name: percent_2
  }

  measure: total_seats_in_constituency {
    type: sum
    sql: ${seatsin_constit} ;;
    value_format_name: decimal_0
  }

  measure: total_seats_filled {
    type: sum
    sql: ${seats_filled} ;;
    value_format_name: decimal_0
  }

  measure: total_number_of_candidates {
    type: sum
    sql: ${number_of_candidates} ;;
    value_format_name: decimal_0
  }

  measure: total_valid_poll {
    type: sum
    sql: ${valid_poll} ;;
  }

  measure: total_quota {
    type: sum
    sql: ${quota} ;;
    value_format_name: decimal_0
  }

  measure: total_spoiled {
    type: sum
    sql: ${spoiled} ;;
  }

  measure: total_required_to_save_deposit {
    type: sum
    sql: ${required_save_deposit};;
    value_format_name: decimal_0
  }

  measure: total_count {
    type: sum
    sql: ${count_number} ;;
  }
}
