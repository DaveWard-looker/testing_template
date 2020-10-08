view: presidential {
  sql_table_name: `daveward_demodataset.presidential`
    ;;

  dimension: candidate {
    type: string
    sql: ${TABLE}.candidate ;;
  }

  dimension: candidatevotes {
    type: number
    sql: ${TABLE}.candidatevotes ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: office {
    type: string
    sql: ${TABLE}.office ;;
  }

  dimension: party {
    type: string
    sql: ${TABLE}.party ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  dimension: state_cen {
    type: number
    sql: ${TABLE}.state_cen ;;
  }

  dimension: state_fips {
    type: number
    sql: ${TABLE}.state_fips ;;
  }

  dimension: state_ic {
    type: number
    sql: ${TABLE}.state_ic ;;
  }

  dimension: state_po {
    type: string
    sql: ${TABLE}.state_po ;;
  }

  dimension: totalvotes {
    type: number
    sql: ${TABLE}.totalvotes ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: writein {
    type: yesno
    sql: ${TABLE}.writein ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
