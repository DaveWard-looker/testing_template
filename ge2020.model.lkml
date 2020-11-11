connection: "bigquery_personal_instance"

include: "/views/GE2020/*.view.lkml"


map_layer: dail {
  feature_key: "ENGLISH_NA"
  file: "/maps/dail_constituencies.json"
  format: topojson
}


explore: ge_2020_ie_constituency_details {}
