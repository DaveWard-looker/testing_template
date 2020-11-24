view: ge_2020_ie_count_details {
  sql_table_name: `daveward-ps-dev.daveward_demodataset.GE_2020_IE_Count_Details`
    ;;
view_label: "Count"

  dimension: candidate_first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.Candidate_First_Name ;;
  }
measure: count_of_candidates {
  type: count_distinct
  sql: ${candidate_id} ;;
}
  dimension: candidate_id {
    hidden: yes
    type: number
    sql: ${TABLE}.Candidate_Id ;;
  }

  dimension: pk_dim {
    hidden: yes
    primary_key: yes
    type: string
    sql: concat(${candidate_name},${candidate_id},${constituency_number}) ;;
  }

  dimension: candidate_surname {
    hidden: yes
    type: string
    sql: ${TABLE}.Candidate_surname ;;
  }

  dimension: candidate_name {
    type: string
    sql: ${candidate_first_name}||' '||${candidate_surname} ;;
  }

  dimension: constituency_name {
    hidden: yes
    type: string
    sql: ${TABLE}.Constituency_Name ;;
  }

  dimension: constituency_number {
    hidden: yes
    type: number
    sql: ${TABLE}.Constituency_Number ;;
  }

  dimension: count_number {
    type: number
    sql: ${TABLE}.Count_Number ;;
  }

  dimension: non_transferable {
    hidden: yes
    type: number
    sql: ${TABLE}.Non_Transferable ;;
  }

  measure: total_non_transferable {
    type: sum
    sql: ${non_transferable} ;;
    value_format_name: decimal_0
  }

  dimension: occurred_on_count {
    type: number
    sql: ${TABLE}.Occurred_On_Count ;;
  }

  dimension: required_to_reach_quota {
    hidden: yes
    type: number
    sql: ${TABLE}.Required_To_Reach_Quota ;;
  }

  measure: total_required_to_reach_quota {
    type: sum
    sql: ${required_to_reach_quota} ;;
    value_format_name: decimal_0
  }

  dimension: required_to_save_deposit {
    hidden: yes
    type: number
    sql: ${TABLE}.Required_To_Save_Deposit ;;
  }

  measure: total_required_to_save_deposit {
    type: sum
    sql: ${required_to_save_deposit} ;;
    value_format_name: decimal_0
  }

  dimension: result {
    type: string
    sql: ${TABLE}.Result ;;
  }

  dimension: votes_in_count {
    hidden: yes
    type: number
    sql: ${TABLE}.Total_Votes ;;
  }

  dimension: transfers {
    hidden: yes
    type: number
    sql: ${TABLE}.Transfers ;;
  }

  measure: total_transfers {
    type: sum
    sql: ${transfers} ;;
    value_format_name: decimal_0
  }

  dimension: votes {
    hidden: yes
    type: number
    sql: ${TABLE}.Votes ;;
  }

  measure: total_votes {
    label: "First Preference Vote"
    type: sum
    sql: ${votes} ;;
  }

  measure: total_vote_in_count{
    type: sum
    sql: ${votes_in_count} ;;
    value_format_name: decimal_0
  }

  measure: final_vote {
    type: max
    sql: ${votes_in_count} ;;
  }

  measure: candidate_saved_deposit {
    type: yesno
    sql: ${final_vote} > ${total_required_to_save_deposit} ;;
  }

  measure: count {
    type: count
    drill_fields: [constituency_name, candidate_surname, candidate_first_name]
  }
}
