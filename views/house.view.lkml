view: house {
  sql_table_name: `daveward-ps-dev.daveward_demodataset.house`
    ;;

  dimension: candidate {
    type: string
    sql: ${TABLE}.candidate ;;
  }

  dimension: candidatevotes {
    type: number
    sql: ${TABLE}.candidatevotes ;;
  }

  dimension: district {
    type: string
    sql: ${TABLE}.district ;;
  }

  dimension: mode {
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

  dimension: runoff {
    type: string
    sql: ${TABLE}.runoff ;;
  }

  dimension: special {
    type: string
    sql: ${TABLE}.special ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.stage ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: state_cen {
    type: string
    sql: ${TABLE}.state_cen ;;
  }

  dimension: state_fips {
    type: string
    sql: ${TABLE}.state_fips ;;
  }

  dimension: state_ic {
    type: string
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

  dimension: unofficial {
    type: string
    sql: ${TABLE}.unofficial ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  dimension: writein {
    type: string
    sql: ${TABLE}.writein ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
