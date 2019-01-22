#!/bin/bash


#FIX BAD FIELD
sed -i 's/\"ALL\ VISHA\"/ALL\ VISHA/' downloads/voterfile.csv

source db.conf
LASTDATE=$(tail -2 updateDates.txt | head -1)
PREVDATE=$(tail -3 updateDates.txt | head -1)
TODAY=$(date +%Y%m%d)

psql -c "CREATE TABLE IF NOT EXISTS public.numbers ( id serial, date_updated date, active integer, confirmation integer, total integer)"
psql -c "DROP TABLE voterfile_$PREVDATE"
psql -c "DROP TABLE vote_verify_$PREVDATE"
psql -c "CREATE TABLE voterfile_new ( like voterfile )"
#pgfutter csv downloads/voterfile.csv

./pgloader --type csv --field "sos_voterid,county_number,county_id,last_name,first_name,middle_name,suffix,date_of_birth,registration_date,voter_status,party_affiliation,residential_address1,residential_secondary_addr,residential_city,residential_state,residential_zip,residential_zip_plus4,residential_country,residential_postalcode,mailing_address1,mailing_secondary_address,mailing_city,mailing_state,mailing_zip,mailing_zip_plus4,mailing_country,mailing_postal_code,career_center,city,city_school_district,county_court_district,congressional_district,court_of_appeals,edu_service_center_district,exempted_vill_school_district,library,local_school_district,municipal_court_district,precinct_name,precinct_code,state_board_of_education,state_representative_district,state_senate_district,township,village,ward,primary_03_07_2000,general_11_07_2000,special_05_08_2001,general_11_06_2001,primary_05_07_2002,general_11_05_2002,special_05_06_2003,general_11_04_2003,primary_03_02_2004,general_11_02_2004,special_02_08_2005,primary_05_03_2005,primary_09_13_2005,general_11_08_2005,special_02_07_2006,primary_05_02_2006,general_11_07_2006,primary_05_08_2007,primary_09_11_2007,general_11_06_2007,primary_11_06_2007,general_12_11_2007,primary_03_04_2008,primary_10_14_2008,general_11_04_2008,general_11_18_2008,primary_05_05_2009,primary_09_08_2009,primary_09_15_2009,primary_09_29_2009,general_11_03_2009,primary_05_04_2010,primary_07_13_2010,primary_09_07_2010,general_11_02_2010,primary_05_03_2011,primary_09_13_2011,general_11_08_2011,primary_03_06_2012,general_11_06_2012,primary_05_07_2013,primary_09_10_2013,primary_10_01_2013,general_11_05_2013,primary_05_06_2014,general_11_04_2014,primary_05_05_2015,primary_09_15_2015,general_11_03_2015,primary_03_15_2016,general_06_07_2016,primary_09_13_2016,general_11_08_2016,primary_05_02_2017,primary_09_12_2017,general_11_07_2017,primary_05_08_2018,general_08_07_2018,general_11_06_2018" --with truncate --with "fields terminated by ','" --with "drop indexes" --with "skip header = 1" --with "fields enclosed by '\"'" --with "concurrency = 8" --with "workers = 8" ./downloads/voterfile.csv $PGSTR?tablename=voterfile_new

#psql -f $INDEX
#psql -f $MVIEW

pigz downloads/voterfile.csv
/home/ubuntu/.local/bin/aws s3 cp downloads/voterfile.csv.gz s3://$S3BUCKET/voterfile_$TODAY/voterfile_$TODAY.csv.gz
rm -f downloads/voterfile.csv.gz
mv downloads/voterfile.csv downloads/old/voterfile.csv
./index.sh
