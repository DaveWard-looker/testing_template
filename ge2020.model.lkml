connection: "bigquery_personal_instance"

include: "/views/GE2020/*.view.lkml"


map_layer: dail {
  feature_key: "ENGLISH_NA"
  file: "/maps/dail_constituencies.json"
  format: topojson
}
explore: ge_2020_ie_candidate_details {}

explore: ge_2020_ie_constituency_details {
  join: ge_2020_ie_candidate_details {
    sql_on: ${ge_2020_ie_constituency_details.constituency_number} = ${ge_2020_ie_candidate_details.constituency_number} ;;
    relationship: one_to_many
  }
  join: ge_2020_ie_count_details {
    sql_on: ${ge_2020_ie_candidate_details.constituency_number} = ${ge_2020_ie_count_details.constituency_number}
    and ${ge_2020_ie_candidate_details.candidate_id} = ${ge_2020_ie_count_details.candidate_id};;
    relationship: one_to_many
  }
}
