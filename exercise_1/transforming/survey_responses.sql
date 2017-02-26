CREATE TABLE survey_responses 
AS

select
provider_id
,hospital_name
,state

,(case when comm_nurse_baseline_rt='Not Available' then NULL
else cast(comm_nurse_baseline_rt as decimal(4,2)) end) as comm_nurse_baseline_rt

,(case when comm_nurse_performance_rt='Not Available' then NULL
else cast(comm_nurse_performance_rt as decimal(4,2)) end) as comm_nurse_performance_rt

,(case when comm_doct_baseline_rt='Not Available' then NULL
else cast(comm_doct_baseline_rt as decimal(4,2)) end) as comm_doct_baseline_rt

,(case when comm_doct_performance_rt='Not Available' then NULL
else cast(comm_doct_performance_rt as decimal(4,2)) end) as comm_doct_performance_rt

,(case when resp_staff_baseline_rt='Not Available' then NULL
else cast(resp_staff_baseline_rt as decimal(4,2)) end) as resp_staff_baseline_rt

,(case when resp_staff_performance_rt='Not Available' then NULL
else cast(resp_staff_performance_rt as decimal(4,2)) end) as resp_staff_performance_rt

,(case when pain_management_baseline_rt='Not Available' then NULL
else cast(pain_management_baseline_rt as decimal(4,2)) end) as pain_management_baseline_rt

,(case when pain_management_performance_rt='Not Available' then NULL
else cast(pain_management_performance_rt as decimal(4,2)) end) as pain_management_performance_rt

,(case when comm_med_baseline_rt='Not Available' then NULL
else cast(comm_med_baseline_rt as decimal(4,2)) end) as comm_med_baseline_rt

,(case when comm_med_performance_rt='Not Available' then NULL
else cast(comm_med_performance_rt as decimal(4,2)) end) as comm_med_performance_rt

,(case when environment_baseline_rt='Not Available' then NULL
else cast(environment_baseline_rt as decimal(4,2)) end) as environment_baseline_rt

,(case when environment_performance_rt='Not Available' then NULL
else cast(environment_performance_rt as decimal(4,2)) end) as environment_performance_rt

,(case when overall_baseline_rt='Not Available' then NULL
else cast(overall_baseline_rt as decimal(4,2)) end) as overall_baseline_rt

,(case when overall_performance_rt='Not Available' then NULL
else cast(overall_performance_rt as decimal(4,2)) end) as overall_performance_rt

,(case when hcahps_base_score='Not Available' then NULL
else cast(hcahps_base_score as decimal(2,0)) end) as hcahps_base_score

,(case when hcahps_consistency_score='Not Available' then NULL
else cast(hcahps_consistency_score as decimal(2,0)) end) as hcahps_consistency_score

from surveys_responses_schema;