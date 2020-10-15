connection: "bigquery_personal_instance"

# include all the views
include: "/views/**/*.view"

datagroup: elections_default_datagroup {
   sql_trigger: SELECT count(*) FROM presidential;;
  max_cache_age: "1 hour"
}

persist_with: elections_default_datagroup

explore: presidential {}

explore: senate {}

explore: house {}

explore: fact_candidate {}
