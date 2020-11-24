view: ge_2020_ie_candidate_details {
  sql_table_name: `daveward-ps-dev.daveward_demodataset.GE_2020_IE_Candidate_Details`;;
view_label: "Candidate"
    dimension: pk_dim {
      primary_key: yes
      type: string
      sql: ${candidate_id}||${count_number}||${constituency_number} ;;
    }

  dimension: candidate_id {
    hidden: yes
    type: number
    sql: ${TABLE}.Candidate_Id ;;
  }

  dimension: constituency {
    hidden: yes
    type: string
    sql: ${TABLE}.Constituency ;;

  }

  dimension: constituency_ainm {
    hidden: yes
    type: string
    sql: ${TABLE}.Constituency_Ainm ;;
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

  dimension: firstname {
    hidden: yes
    type: string
    sql: ${TABLE}.Firstname ;;
  }

  dimension: gender_id {
    type: string
    sql: ${TABLE}.Gender_Id ;;
  }

  dimension: party_abbreviation {
    type: string
    sql: ${TABLE}.Party_Abbreviation ;;
  }

  dimension: party_id {
    label: "Party Name"
    type: string
    sql: ${TABLE}.Party_Id ;;
  }

  dimension: required_to_reach_quota {
    hidden: yes
    type: number
    sql: ${TABLE}.Required_To_Reach_Quota ;;
  }

  dimension: required_to_save_deposit {
    type: number
    sql: ${TABLE}.Required_To_Save_Deposit ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}.Result ;;
  }

  dimension: surname {
    hidden: yes
    type: string
    sql: ${TABLE}.Surname ;;
  }

  dimension: votes {
    hidden: yes
    type: number
    sql: ${TABLE}.Votes ;;
  }

  dimension: candidate {
    type: string
    sql: concat(${firstname},' ',${surname}) ;;
  }

  measure: total_votes {
    type: sum
    sql: ${votes} ;;
  }

  measure: total_required_to_reach_quota {
    type: sum
    sql: ${required_to_reach_quota} ;;
    value_format_name: decimal_0
  }

  measure: total_required_to_save_deposit {
    type: sum
    sql: ${required_to_save_deposit} ;;
  }

  measure: candidate_saved_deposit {
    type: yesno
    sql: ${total_votes} > ${total_required_to_save_deposit} ;;
  }

  measure: total_first_preference_votes {
    type: sum
    sql: ${votes} ;;
    filters: [count_number: "1"]
  }
}
