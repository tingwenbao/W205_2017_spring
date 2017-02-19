
# save my current directory
MY_CWD=$(pwd)

# empty and remove staging directories if exist
rm ~/staging/exercise_1/*
rmdir ~/staging/exercise_1
rmdir ~/staging

# name the file names same as load_data_lake.sh

NEW_FILE1="hospitals.csv"
NEW_FILE2="effective_care.csv"
NEW_FILE3="readmissions.csv"
NEW_FILE4="Measures.csv"
NEW_FILE5="surveys_responses.csv"

# remove files from hdfs
hdfs dfs -rm /user/w205/hospital_compare/$NEW_FILE1/$NEW_FILE1
hdfs dfs -rm /user/w205/hospital_compare/$NEW_FILE2/$NEW_FILE2
hdfs dfs -rm /user/w205/hospital_compare/$NEW_FILE3/$NEW_FILE3
hdfs dfs -rm /user/w205/hospital_compare/$NEW_FILE4/$NEW_FILE4
hdfs dfs -rm /user/w205/hospital_compare/$NEW_FILE5/$NEW_FILE5

# remove file directory
hdfs dfs -rmdir /user/w205/hospital_compare/$NEW_FILE1
hdfs dfs -rmdir /user/w205/hospital_compare/$NEW_FILE2
hdfs dfs -rmdir /user/w205/hospital_compare/$NEW_FILE3
hdfs dfs -rmdir /user/w205/hospital_compare/$NEW_FILE4
hdfs dfs -rmdir /user/w205/hospital_compare/$NEW_FILE5

# remove hdfs directory
hdfs dfs -rmdir /user/w205/hospital_compare

# change directory back to the original
cd $MY_CWD

# clean exit
exit