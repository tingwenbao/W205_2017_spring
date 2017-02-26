
select
a.measure_id
,a.measure_nm
,cast(a.rsd as decimal(3,2)) as rsd

from

(select
measure_id
,measure_nm
,stddev(score)/avg(score) as rsd
from effective_care
where score is not null
group by measure_id, measure_nm

union all

select
measure_id
,measure_nm
,stddev(score)/avg(score) as rsd
from readmissions
where score is not null
group by measure_id, measure_nm
) a

order by rsd desc
limit 10;