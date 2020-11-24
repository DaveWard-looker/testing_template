connection: "bigquery_personal_instance"

include: "/views/GE2020/*.view.lkml"


# map_layer: dail {
#   feature_key: "ENGLISH_NA"
#   file: "/maps/dail_constituencies.json"
#   format: topojson
# }
explore: ge_2020_ie_candidate_details {}

explore: ge_2020_ie_constituency_details {
  label: "GE2020"
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

datagroup: default_data_group {
  max_cache_age: "1 hour"
  sql_trigger: SELECT max(Count_Number) FROM `{{ _user_attributes['db_project'] }}.{{ _user_attributes['database'] }}.GE_2020_IE_Constituency_Details`  ;;
}

explore: GE_2020_detail {
  fields: [ALL_FIELDS*]
  description: "My extended explore"
  from: ge_2020_ie_constituency_details
  view_name: ge_2020_ie_constituency_details
  extends: [ge_2020_ie_constituency_details]
  join: ge_2020_ie_count_details {
    fields: []
    sql_on: ${ge_2020_ie_candidate_details.constituency_number} = ${ge_2020_ie_count_details.constituency_number}
      and ${ge_2020_ie_candidate_details.candidate_id} = ${ge_2020_ie_count_details.candidate_id};;
    relationship: one_to_many
  }
}

explore: fact_dublin {}


map_layer: canadian_provinces {

  format: "vector_tile_region"

  url: "https://a.tiles.mapbox.com/v4/looker-maps.oh_canada/{z}/{x}/{y}.mvt?access_token=@{mapbox_api_key}"

  feature_key: "provinces"

  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/c98a443cfd7dc93191a3f3f6c54059b9a35a9134/canada_provinces.json"

  min_zoom_level: 2

  max_zoom_level: 10

  property_key: "PRENAME"

}


map_layer: uk_postal_districts {

  format: "vector_tile_region"

  url: "https://a.tiles.mapbox.com/v4/looker-maps.63tiis35/{z}/{x}/{y}.mvt?access_token=@{mapbox_api_key}"

  feature_key: "PostalDistrict-5b1t0d"

  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/6b7c7cff6d193189cca4f73b314f558e8ee58f85/uk_postal_districts.json"

  min_zoom_level: 8

  max_zoom_level: 13

  property_key: "PostDist"

}

map_layer: irish_dail {

  format: "vector_tile_region"

  url: "https://a.tiles.mapbox.com/v4/daithibhard.acymg4zw/{z}/{x}/{y}.mvt?access_token=@{mapbox_api_key}"

  feature_key: "ENGLISH_NA"

 extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/6b7c7cff6d193189cca4f73b314f558e8ee58f85/uk_postal_districts.json"

  min_zoom_level: 2

  max_zoom_level: 13

  property_key: "BDY_ID"

}
