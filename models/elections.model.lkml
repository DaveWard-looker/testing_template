connection: "bigquery_personal_instance"

# include all the views
include: "/views/**/*.view"

datagroup: elections_default_datagroup {
   sql_trigger: SELECT count(*) FROM presidential;;
  max_cache_age: "1 hour"
}

persist_with: elections_default_datagroup

explore: fact_candidate {}

explore: ge_2020 {
  from: ge_2020_ie_count_details
}

explore: ge_2020_ie_candidate_details {}

explore: ge_2020_ie_constituency_details {}

map_layer: dail_constituencies {
  feature_key: "ENGLISH_NA"
  file: "/maps/dail_constituencies.json"
  format: topojson
  label: "a list of constituencies"
  property_key: "ENGLISH_NA"
  property_label_key: "ENGLISH_NA"
}
