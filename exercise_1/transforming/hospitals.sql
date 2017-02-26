CREATE TABLE hospitals 
AS 

SELECT 
provider_id
,hospital_name
,state

, (case  
when hospital_overall_rating='Not Available' then NULL
else cast(hospital_overall_rating as decimal(1,0)) end) as hospital_overall_rating

, (case  
when mortality_ntl_comparison='Not Available' then NULL
else mortality_ntl_comparison end) as mortality_national_comparison

, (case  
when safety_care_ntl_comparison='Not Available' then NULL
else safety_care_ntl_comparison end) as safety_national_comparison

, (case  
when readmission_ntl_comparison='Not Available' then NULL
else readmission_ntl_comparison end) as readmission_national_comparison

, (case  
when patient_exp_ntl_comparison='Not Available' then NULL
else patient_exp_ntl_comparison end) as experience_national_comparison

, (case  
when effectiveness_care_ntl_comparison='Not Available' then NULL
else effectiveness_care_ntl_comparison end) as effectiveness_national_comparison

, (case  
when timeliness_care_ntl_comparison='Not Available' then NULL
else timeliness_care_ntl_comparison end) as timeliness_national_comparison

, (case  
when efficient_medimage_ntl_comparison='Not Available' then NULL
else efficient_medimage_ntl_comparison end) as efficient_national_comparison
 
FROM hospitals_schema;