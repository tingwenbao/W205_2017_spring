CREATE TABLE hospitals 
AS 
SELECT 
provider_id
,hospital_name
,state
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

FROM hospitals_schema;