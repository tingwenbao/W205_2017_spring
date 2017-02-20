select
a.measure_id
,a.measure_nm
,stddev(a.modified_score)/avg(a.modified_score) as rsd
from 
(
select
provider_id
,measure_id
,measure_nm
,(case 
when score='Low (0 - 19,999 patients annually)' then 1
when score='Medium (20,000 - 39,999 patients annually)' then 2
when score='High (40,000 - 59,999 patients annually)' then 3
when score='Very High (60,000+ patients annually)' then 4
else cast(score as int) end) as modified_score
from effective_care_schema
where score is not null) a
group by a.measure_id, measure_nm
order by rsd desc
limit 10;