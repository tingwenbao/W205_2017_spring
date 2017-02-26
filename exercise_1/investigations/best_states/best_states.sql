
select
a.state
, avg(a.hospital_overall_rating) as avg_overall_score
,count(provider_id) as hospital_count
, cast((avg(mortality_score)+avg(safety_score)+avg(readmission_score)+avg(patient_exp_score)+avg(effectiveness_score)+avg(timeliness_score)+avg(efficient_score)) as decimal(5,3)) as sum_avg_matrix_score
,cast((stddev_pop(mortality_score)+stddev_pop(safety_score)+stddev_pop(readmission_score)+stddev_pop(patient_exp_score)+stddev_pop(effectiveness_score)+stddev_pop(timeliness_score)+stddev_pop(efficient_score)) as decimal(5,3)) as sum_stddev

from 
(select 
provider_id
,state
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
where hospital_overall_rating is not NuLL
) a
group by a.state
order by avg_overall_score desc, sum_avg_matrix_score desc, sum_stddev asc
limit 10;