Loading and Modeling

This folder contains:
1. CLEAN_load_data_lakes.sh: clean up previous settings by running load_data_lake.sh before reload the data
2. load_data_lake.sh: create the data lake of the data
3. hive_base_ddl.sql: create the DDL for medicare data
4. ER Diagram.png: the demonstration of the data structure in this database

To run the files:
1. Launch AWS instance, mount file system, and start hadoop, postgres
2. Change user to w205 and start Hive metastore
3. Moving under the directory of the folder loading_and_modeling
4. Run the load_data_lake.sh as: 
    $ ./load_data_lake.sh 
    , if want to rerun this file, run CLEAN_load_data_lake.sh first: 
    $ ./CLEAN_load_data_lakes.sh
5. Set up DDL by running the .sql file in hive: $ hive -f hive_base_ddl.sql
