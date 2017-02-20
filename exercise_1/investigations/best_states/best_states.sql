
select
state
, avg(hospital_overall_rating) as avg_overall_score
from hospitals_schema
group by state
order by avg_overall_score desc
limit 10;