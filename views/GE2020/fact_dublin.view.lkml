view: fact_dublin {
  derived_table: {
    sql: SELECT
      'Dublin' as county, SUM(Number_of_Seats) as Seats, Sum(Quota) as Quota, SUM(Total_Poll) as Total_Poll, SUM(Valid_Poll) as Valid_Poll
      FROM `GE_2020_IE_Constituency_Details`
      WHERE Constituency_Name like '%Dublin%'
       ;;
      datagroup_trigger: default_data_group
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: seats {
    type: number
    sql: ${TABLE}.Seats ;;
  }

  dimension: quota {
    type: number
    sql: ${TABLE}.Quota ;;
  }

  dimension: total_poll {
    type: number
    sql: ${TABLE}.Total_Poll ;;
  }

  dimension: valid_poll {
    type: number
    sql: ${TABLE}.Valid_Poll ;;
  }

  set: detail {
    fields: [county, seats, quota, total_poll, valid_poll]
  }
}
