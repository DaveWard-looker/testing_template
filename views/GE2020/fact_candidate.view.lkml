view: fact_candidate {
  derived_table: {
    sql: SELECT year, candidate, party, candidatevotes FROM  `daveward-ps-dev.daveward_demodataset.presidential`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: candidate {
    type: string
    sql: ${TABLE}.candidate ;;
  }

  dimension: party {
    type: string
    sql: ${TABLE}.party ;;
  }

  dimension: candidatevotes {
    type: number
    sql: ${TABLE}.candidatevotes ;;
  }

  set: detail {
    fields: [year, candidate, party, candidatevotes]
  }
}
