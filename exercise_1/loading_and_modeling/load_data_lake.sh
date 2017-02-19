!/bin/bash

# save my current directory
MY_CWD=$(pwd)

# create staging directories
mkdir ~/staging
mkdir ~/staging/exercise_1

# change to staging directory
cd ~/staging/exercise_1

# get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip

# unzip medicare data
unzip medicare_data.zip

# remove first line of files and rename

# File1: Hospital General Informaion
OLD_FILE1="Hospital General Information.csv"
NEW_FILE1="hospitals.csv"
tail -n +2 "$OLD_FILE1">$NEW_FILE1

# File2: Timely and effective care
OLD_FILE2="Timely and Effective Care - Hospital.csv"
NEW_FILE2="effective_care.csv"
tail -n +2 "$OLD_FILE2">$NEW_FILE2

# File3: Readmissions and deaths
OLD_FILE3="Readmissions and Deaths - Hospital.csv"
NEW_FILE3="readmissions.csv"
tail -n +2 "$OLD_FILE3">$NEW_FILE3

# File4: Mapping of measure to codes
OLD_FILE4="Measure Dates.csv"
NEW_FILE4="Measures.csv"
tail -n +2 "$OLD_FILE4">$NEW_FILE4

# File5: Example of survey response
OLD_FILE5="hvbp_hcahps_11_10_2016.csv"
NEW_FILE5="surveys_responses.csv"
tail -n +2 "$OLD_FILE5">$NEW_FILE5

# create hdfs directory
hdfs dfs -mkdir /user/w205/hospital_compare

# create hdfs directory for each of the data files
hdfs dfs -mkdir /user/w205/hospital_compare/$NEW_FILE1
hdfs dfs -mkdir /user/w205/hospital_compare/$NEW_FILE2
hdfs dfs -mkdir /user/w205/hospital_compare/$NEW_FILE3
hdfs dfs -mkdir /user/w205/hospital_compare/$NEW_FILE4
hdfs dfs -mkdir /user/w205/hospital_compare/$NEW_FILE5

# copy the 5 files to their own hdfs directory
hdfs dfs -put $NEW_FILE1 /user/w205/hospital_compare/$NEW_FILE1
hdfs dfs -put $NEW_FILE2 /user/w205/hospital_compare/$NEW_FILE2
hdfs dfs -put $NEW_FILE3 /user/w205/hospital_compare/$NEW_FILE3
hdfs dfs -put $NEW_FILE4 /user/w205/hospital_compare/$NEW_FILE4
hdfs dfs -put $NEW_FILE5 /user/w205/hospital_compare/$NEW_FILE5

# change directory back to the original
cd $MY_CWD

exit