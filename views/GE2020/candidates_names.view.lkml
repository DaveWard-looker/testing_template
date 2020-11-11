include: "ge_2020_ie_candidate_details.view"
view: +ge_2020_ie_candidate_details {
  dimension: candidate_name {
    type: string
    sql: ${firstname} || ${surname} ;;

  }

  dimension: constituency_ainm {
    hidden: yes
    type: string
    sql: ${TABLE}.constituency_ainm ;;
  }
  }
