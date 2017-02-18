#!/bin/bash

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
unzip -f medicare_data.zip

# remove first line of files and rename
OLD_FILE="Hospital General Information.csv"
NEW_FILE="hospitals.csv"

tail -n +2 "$OLD_FILE">$NEW_FILE

# TBD - 4 other files

# create hdfs directory
hdfs dfs -mkdir /user/w205/hospital_compare

# copy the files to hdfs
hdfs dfs -put $NEW_FILE /user/w205/hospital_compare

# TBD 4 other files

# change directory back to the original
cd $MY_CWD

exit