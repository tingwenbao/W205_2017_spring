CREATE TABLE readmissions 
AS

select
provider_id
,hospital_name
,state
,measure_nm
,measure_id
,compare_national

,(case when denominator='Not Available' then NULL
else cast(denominator as decimal(5,0)) end) as denominator

,(case when score='Not Available' then NULL
else cast(score as decimal(3,1)) end) as score

,cast(
concat(substr(measure_start_dt,7,4),'-',
substr(measure_start_dt,1,2),'-',
substr(measure_start_dt,4,2)) as date) as measure_start_date

,cast(
concat(substr(measure_end_dt,7,4),'-',
substr(measure_end_dt,1,2),'-',
substr(measure_end_dt,4,2)) as date) as measure_end_date

from readmissions_schema;