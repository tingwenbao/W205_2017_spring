select
provider_id
,hospital_name
,hospital_overall_rating
,(mortality_score+safety_score+readmission_score+patient_exp_score+effectiveness_score+timeliness_score+medimage_score) as aggregated_score
from(
select 
provider_id
,hospital_name
,hospital_overall_rating
,(case mortality_ntl_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as mortality_score
,(case safety_care_ntl_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as safety_score
,(case readmission_ntl_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as readmission_score
,(case patient_exp_ntl_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as patient_exp_score
,(case effectiveness_care_ntl_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as effectiveness_score
,(case timeliness_care_ntl_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as timeliness_score
,(case efficient_medimage_ntl_comparison 
when 'Above the National average' then 3
when 'Same as the National average' then 2
when 'Below the National average' then 1
else 0 end) as medimage_score
from hospitals_schema
) a
where a.hospital_overall_rating='5'
order by aggregated_score desc
limit 10;