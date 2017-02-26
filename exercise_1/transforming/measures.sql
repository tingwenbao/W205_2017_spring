CREATE TABLE measures 
AS

select
measure_nm
,measure_id
,measure_start_qt

,cast(
concat(substr(measure_start_dt,7,4),'-',
substr(measure_start_dt,1,2),'-',
substr(measure_start_dt,4,2)) as date) as measure_start_date

,measure_end_qt

,cast(
concat(substr(measure_end_dt,7,4),'-',
substr(measure_end_dt,1,2),'-',
substr(measure_end_dt,4,2)) as date) as measure_end_date

from measures_schema;
