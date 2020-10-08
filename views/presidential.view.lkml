view: presidential {
  sql_table_name: `daveward_demodataset.presidential`
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

  dimension: notes {
    hidden: yes
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: office {
    hidden: yes
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

  dimension: version {
    hidden: yes
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
  value_format_name: id
  }

  measure: total_candidate_votes {
    type: sum
    sql: ${candidatevotes} ;;
    value_format_name: decimal_0
  }

  measure: total_democrat_vote {
    type: sum
    sql: ${candidatevotes} ;;
    filters: [party: "democrat"]
    value_format_name: decimal_0
  }

  measure: total_republician_vote {
    type: sum
    sql: ${candidatevotes} ;;
    filters: [party: "republican"]
    value_format_name: decimal_0
  }

  measure: percentage_of_vote {
    type: sum
    sql: ${candidatevotes}/nullif(${totalvotes},0) ;;
    value_format_name: percent_2
  }

  measure: average_candidate_votes {
    type: sum
    sql: ${candidatevotes} ;;
    value_format_name: decimal_0
  }

  measure: total_write_in_vote {
    type: sum
    sql: ${candidatevotes} ;;
    filters: [writein: "yes"]
  }


  measure: 3rd_party_votes {
    type: sum
    sql: case when presidential.party IN ('democrat', 'republican') then 0 else ${candidatevotes} end ;;
    value_format_name: decimal_0
  }

  measure: main_party_votes {
    type: sum
    sql: case when presidential.party not IN ('democrat', 'republican') then 0 else ${candidatevotes} end ;;
    value_format_name: decimal_0
  }

  measure: winner_votes {
    type: number
    sql: case when ${total_republician_vote} > ${total_democrat_vote} then ${total_republician_vote} else ${total_democrat_vote} end ;;
    value_format_name: decimal_2
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
