DROP TABLE  hospitals_schema;
CREATE EXTERNAL TABLE hospitals_schema 
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zipcode string,
county string,
phone_number string,
hospital_type string,
hospital_ownership string,
emergency_services string,
meet_use_EHR string,
hospital_overall_rating string,
hospital_overall_rating_fn string,
mortality_ntl_comparison string,
mortality_ntl_comparison_fn string,
safety_care_ntl_comparison string,
safety_care_ntl_comparison_fn string,
readmission_ntl_comparison string,
readmission_ntl_comparison_fn string,
patient_exp_ntl_comparison string,
patient_exp_ntl_comparison_fn string,
effectiveness_care_ntl_comparison string,
effectiveness_care_ntl_comparison_fn string,
timeliness_care_ntl_comparison string,
timeliness_care_ntl_comparison_fn string,
efficient_medimage_ntl_comparison string,
efficient_medimage_ntl_comparison_fn string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals.csv';