CREATE TABLE effective_care 
AS

select
provider_id
,hospital_name
,state
,condition
,measure_id
,measure_nm

,(case when score='Very High (60,000+ patients annually)' then 4
when score='High (40,000 - 59,999 patients annually)' then 3
when score='Medium (20,000 - 39,999 patients annually)' then 2
when score='Low (0 - 19,999 patients annually)' then 1
when score='Not Available' then NULL
else cast(score as decimal(4,0)) end) as score 

,(case when sample='Not Available' then NULL
else cast(sample as decimal(6,0)) end) as sample

,cast(
concat(substr(measure_start_dt,7,4),'-',
substr(measure_start_dt,1,2),'-',
substr(measure_start_dt,4,2)) as date) as measure_start_date

,cast(
concat(substr(measure_end_dt,7,4),'-',
substr(measure_end_dt,1,2),'-',
substr(measure_end_dt,4,2)) as date) as measure_end_date

from effective_care_schema;