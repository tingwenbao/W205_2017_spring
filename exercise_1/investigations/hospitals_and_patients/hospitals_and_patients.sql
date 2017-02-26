create table hospital_score
as

select 
b.provider_id
,b.hospital_name
,b.hospital_overall_rating
,cast(b.mean_score as decimal(3,2)) as score_mean
,cast((pow(mortality_score-mean_score,2)+pow(safety_score-mean_score,2)+pow(readmission_score-mean_score,2)+pow(patient_exp_score-mean_score,2)+pow(effectiveness_score-mean_score,2)+pow(timeliness_score-mean_score,2)+pow(efficient_score-mean_score,2))/7 as decimal(5,3))as variance

from(
select
a.provider_id
,a.hospital_name
,a.hospital_overall_rating
,a.mortality_score
,a.safety_score
,a.readmission_score
,a.patient_exp_score
,a.effectiveness_score
,a.timeliness_score
,a.efficient_score
,(mortality_score+ safety_score+ readmission_score+ patient_exp_score+ effectiveness_score+ timeliness_score + efficient_score)/7 as mean_score

from(
select 
provider_id
,hospital_name
,hospital_overall_rating
,(case mortality_national_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as mortality_score
,(case safety_national_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as safety_score
,(case readmission_national_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as readmission_score
,(case experience_national_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as patient_exp_score
,(case effectiveness_national_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as effectiveness_score
,(case timeliness_national_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as timeliness_score
,(case efficient_national_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as efficient_score
from hospitals
) a

where a.hospital_overall_rating is not NuLL
) b
;


create table survey_score
as

select
a.provider_id
,a.overall_performance_rt
,(pow(comm_nurse_performance_rt-mean_score,2)+pow(comm_doct_performance_rt-mean_score,2)+pow(resp_staff_performance_rt-mean_score,2)+pow(pain_management_performance_rt-mean_score,2)+pow(comm_med_performance_rt-mean_score,2)+pow(environment_performance_rt-mean_score,2))/6 as variance

from 
(
select 
provider_id
,overall_performance_rt
,comm_nurse_performance_rt
,comm_doct_performance_rt
,resp_staff_performance_rt
,pain_management_performance_rt
,comm_med_performance_rt
,environment_performance_rt
,(comm_nurse_performance_rt+comm_doct_performance_rt+resp_staff_performance_rt+pain_management_performance_rt+comm_med_performance_rt+environment_performance_rt)/6 as mean_score
from survey_responses
where overall_performance_rt is not NULL
) a
;


select
corr(a.score_mean, b.overall_performance_rt) as corr_performance
,corr(a.variance, b.variance) as corr_variance
from hospital_score a 
inner join survey_score b 
on a.provider_id=b.provider_id;
