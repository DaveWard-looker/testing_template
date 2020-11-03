view: senate {
  sql_table_name: `daveward-ps-dev.daveward_demodataset.senate`
    ;;

  dimension: candidate {
    type: string
    sql: ${TABLE}.candidate ;;
  }

  dimension: candidatevotes {
    hidden: yes
    type: number
    sql: ${TABLE}.candidatevotes ;;
  }

  dimension: district {
    hidden: yes
    type: string
    sql: ${TABLE}.district ;;
  }

  dimension: mode {
    hidden: yes
    type: string
    sql: ${TABLE}.mode ;;
  }

  dimension: office {
    type: string
    sql: ${TABLE}.office ;;
  }

  dimension: party {
    type: string
    sql: ${TABLE}.party ;;
  }

  dimension: special {
    type: yesno
    sql: ${TABLE}.special ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.stage ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  dimension: state_cen {
    hidden: yes
    type: number
    sql: ${TABLE}.state_cen ;;
  }

  dimension: state_fips {
    hidden: yes
    type: number
    sql: ${TABLE}.state_fips ;;
  }

  dimension: state_ic {
    hidden: yes
    type: number
    sql: ${TABLE}.state_ic ;;
  }

  dimension: state_po {
    hidden: yes
    type: string
    sql: ${TABLE}.state_po ;;
  }

  dimension: totalvotes {
    hidden: yes
    type: number
    sql: ${TABLE}.totalvotes ;;
  }

  dimension: unofficial {
    type: yesno
    sql: ${TABLE}.unofficial ;;
  }

  dimension: version {
    hidden: yes
    type: string
    sql: ${TABLE}.version ;;
  }

  dimension: writein {
    type: yesno
    sql: ${TABLE}.writein ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
    value_format_name: id
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_votes {
    type: sum
    sql: ${totalvotes} ;;
    value_format_name: decimal_0
  }

  measure: total_candidate_votes {
    type: sum
    sql: ${candidatevotes} ;;
    value_format_name: decimal_0
  }
}
