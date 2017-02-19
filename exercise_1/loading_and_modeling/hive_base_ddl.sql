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


DROP TABLE  effective_care_schema;
CREATE EXTERNAL TABLE effective_care_schema 
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zipcode string,
county string,
phone_number string,
condition string,
measure_id string,
measure_nm string,
score string,
sample string,
fn string,
measure_start_dt string,
measure_end_dt string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care.csv';


DROP TABLE  readmissions_schema;
CREATE EXTERNAL TABLE readmissions_schema 
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zipcode string,
county string,
phone_number string,
measure_nm string,
measure_id string,
compare_national string,
denominator string,
score string,
lower_est string,
higher_est string,
fn string,
measure_start_dt string,
measure_end_dt string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions.csv';


DROP TABLE  measures_schema;
CREATE EXTERNAL TABLE measures_schema 
(
measure_nm string,
measure_id string,
measure_start_qt string,
measure_start_dt string,
measure_end_qt string,
measure_end_dt string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/Measures.csv';


DROP TABLE  surveys_responses_schema;
CREATE EXTERNAL TABLE surveys_responses_schema 
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zipcode string,
county string,
comm_nurse_floor string,
comm_nurse_achieve_threshold string,
comm_nurse_benchmark string,
comm_nurse_baseline_rt string,
comm_nurse_performance_rt string,
comm_nurse_achievement_pt string,
comm_nurse_improvement_pt string,
comm_nurse_dim_score string,
comm_doct_floor string,
comm_doct_achieve_threshold string,
comm_doct_benchmark string,
comm_doct_baseline_rt string,
comm_doct_performance_rt string,
comm_doct_achievement_pt string,
comm_doct_improvement_pt string,
comm_doct_dim_score string,
resp_staff_floor string,
resp_staff_achieve_threshold string,
resp_staff_benchmark string,
resp_staff_baseline_rt string,
resp_staff_performance_rt string,
resp_staff_achievement_pt string,
resp_staff_improvement_pt string,
resp_staff_dim_score string, 
pain_management_floor string,
pain_management_achieve_threshold string,
pain_management_benchmark string,
pain_management_baseline_rt string,
pain_management_performance_rt string,
pain_management_achievement_pt string,
pain_management_improvement_pt string,
pain_management_dim_score string, 
comm_med_floor string,
comm_med_achieve_threshold string,
comm_med_benchmark string,
comm_med_baseline_rt string,
comm_med_performance_rt string,
comm_med_achievement_pt string,
comm_med_improvement_pt string,
comm_med_dim_score string,
environment_floor string,
environment_achieve_threshold string,
environment_benchmark string,
environment_baseline_rt string,
environment_performance_rt string,
environment_achievement_pt string,
environment_improvement_pt string,
environment_dim_score string,
discharge_info_floor string,
discharge_info_achieve_threshold string,
discharge_info_benchmark string,
discharge_info_baseline_rt string,
discharge_info_performance_rt string,
discharge_info_achievement_pt string,
discharge_info_improvement_pt string,
discharge_info_dim_score string,
overall_floor string,
overall_achieve_threshold string,
overall_benchmark string,
overall_baseline_rt string,
overall_performance_rt string,
overall_achievement_pt string,
overall_improvement_pt string,
overall_dim_score string,
hcahps_base_score string,
hcahps_consistency_score string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses.csv';