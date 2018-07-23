alter table public.voterfile add CONSTRAINT voterfile_pk PRIMARY KEY (sos_voterid);
create index first_name_idx on public.voterfile using btree (first_name);
create index last_name_idx on public.voterfile using btree (last_name);
create index name_trgm_idx on public.voterfile using GIST ((coalesce(first_name, '') || ' ' || coalesce(last_name, '')) gist_trgm_ops);
CREATE INDEX first_trgm_idx ON public.voterfile USING gin (first_name gin_trgm_ops) ;
CREATE INDEX first_name_metaphone_idx ON public.voterfile USING gin (metaphone(first_name, 3) gin_trgm_ops) ;
CREATE INDEX last_name_metaphone_idx ON public.voterfile USING gin (metaphone(last_name, 5) gin_trgm_ops) ;
CREATE INDEX last_trgm_idx ON public.voterfile USING gin (last_name gin_trgm_ops) ;
CREATE INDEX voterfile_career_center ON public.voterfile USING btree (career_center) ;
CREATE INDEX voterfile_city ON public.voterfile USING gin (city gin_trgm_ops) ;
CREATE INDEX voterfile_city_school_district ON public.voterfile USING btree (city_school_district) ;
CREATE INDEX voterfile_congressional_district ON public.voterfile USING btree (congressional_district) ;
CREATE INDEX voterfile_county_court_district ON public.voterfile USING btree (county_court_district) ;
CREATE INDEX voterfile_county_id ON public.voterfile USING btree (county_id) ;
CREATE INDEX voterfile_county_number ON public.voterfile USING btree (county_number) ;
CREATE INDEX voterfile_court_of_appeals ON public.voterfile USING btree (court_of_appeals) ;
CREATE INDEX voterfile_date_of_birth ON public.voterfile USING btree (date_of_birth) ;
CREATE INDEX voterfile_age ON public.voterfile USING btree (date_part('year', age(date_of_birth))) ;
CREATE INDEX voterfile_edu_service_center_district ON public.voterfile USING btree (edu_service_center_district) ;
CREATE INDEX voterfile_exempted_vill_school_district ON public.voterfile USING btree (exempted_vill_school_district) ;
CREATE INDEX voterfile_first_name ON public.voterfile USING gin (first_name) ;
CREATE INDEX voterfile_general_06_07_2016 ON public.voterfile USING btree (general_06_07_2016) ;
CREATE INDEX voterfile_general_11_02_2004 ON public.voterfile USING btree (general_11_02_2004) ;
CREATE INDEX voterfile_general_11_02_2010 ON public.voterfile USING btree (general_11_02_2010) ;
CREATE INDEX voterfile_general_11_03_2009 ON public.voterfile USING btree (general_11_03_2009) ;
CREATE INDEX voterfile_general_11_03_2015 ON public.voterfile USING btree (general_11_03_2015) ;
CREATE INDEX voterfile_general_11_04_2003 ON public.voterfile USING btree (general_11_04_2003) ;
CREATE INDEX voterfile_general_11_04_2008 ON public.voterfile USING btree (general_11_04_2008) ;
CREATE INDEX voterfile_general_11_04_2014 ON public.voterfile USING btree (general_11_04_2014) ;
CREATE INDEX voterfile_general_11_05_2002 ON public.voterfile USING btree (general_11_05_2002) ;
CREATE INDEX voterfile_general_11_05_2013 ON public.voterfile USING btree (general_11_05_2013) ;
CREATE INDEX voterfile_general_11_06_2001 ON public.voterfile USING btree (general_11_06_2001) ;
CREATE INDEX voterfile_general_11_06_2007 ON public.voterfile USING btree (general_11_06_2007) ;
CREATE INDEX voterfile_general_11_06_2012 ON public.voterfile USING btree (general_11_06_2012) ;
CREATE INDEX voterfile_general_11_07_2000 ON public.voterfile USING btree (general_11_07_2000) ;
CREATE INDEX voterfile_general_11_07_2006 ON public.voterfile USING btree (general_11_07_2006) ;
CREATE INDEX voterfile_general_11_07_2017 ON public.voterfile USING btree (general_11_07_2017) ;
CREATE INDEX voterfile_general_11_08_2005 ON public.voterfile USING btree (general_11_08_2005) ;
CREATE INDEX voterfile_general_11_08_2011 ON public.voterfile USING btree (general_11_08_2011) ;
CREATE INDEX voterfile_general_11_08_2016 ON public.voterfile USING btree (general_11_08_2016) ;
CREATE INDEX voterfile_general_11_18_2008 ON public.voterfile USING btree (general_11_18_2008) ;
CREATE INDEX voterfile_general_12_11_2007 ON public.voterfile USING btree (general_12_11_2007) ;
CREATE INDEX voterfile_last_name ON public.voterfile USING gin (last_name) ;
CREATE INDEX voterfile_library ON public.voterfile USING btree (library) ;
CREATE INDEX voterfile_local_school_district ON public.voterfile USING btree (local_school_district) ;
CREATE INDEX voterfile_mailing_address1 ON public.voterfile USING btree (mailing_address1) ;
CREATE INDEX voterfile_mailing_city ON public.voterfile USING btree (mailing_city) ;
CREATE INDEX voterfile_mailing_country ON public.voterfile USING btree (mailing_country) ;
CREATE INDEX voterfile_mailing_postal_code ON public.voterfile USING btree (mailing_postal_code) ;
CREATE INDEX voterfile_mailing_secondary_address ON public.voterfile USING btree (mailing_secondary_address) ;
CREATE INDEX voterfile_mailing_state ON public.voterfile USING btree (mailing_state) ;
CREATE INDEX voterfile_mailing_zip ON public.voterfile USING btree (mailing_zip) ;
CREATE INDEX voterfile_mailing_zip_plus4 ON public.voterfile USING btree (mailing_zip_plus4) ;
CREATE INDEX voterfile_middle_name ON public.voterfile USING btree (middle_name) ;
CREATE INDEX voterfile_municipal_court_district ON public.voterfile USING btree (municipal_court_district) ;
CREATE INDEX voterfile_party_affiliation ON public.voterfile USING btree (party_affiliation) ;
CREATE INDEX voterfile_precinct_code ON public.voterfile USING btree (precinct_code) ;
CREATE INDEX voterfile_precinct_name ON public.voterfile USING btree (precinct_name) ;
CREATE INDEX voterfile_primary_03_02_2004 ON public.voterfile USING btree (primary_03_02_2004) ;
CREATE INDEX voterfile_primary_03_04_2008 ON public.voterfile USING btree (primary_03_04_2008) ;
CREATE INDEX voterfile_primary_03_06_2012 ON public.voterfile USING btree (primary_03_06_2012) ;
CREATE INDEX voterfile_primary_03_07_2000 ON public.voterfile USING btree (primary_03_07_2000) ;
CREATE INDEX voterfile_primary_03_15_2016 ON public.voterfile USING btree (primary_03_15_2016) ;
CREATE INDEX voterfile_primary_05_02_2006 ON public.voterfile USING btree (primary_05_02_2006) ;
CREATE INDEX voterfile_primary_05_02_2017 ON public.voterfile USING btree (primary_05_02_2017) ;
CREATE INDEX voterfile_primary_05_03_2005 ON public.voterfile USING btree (primary_05_03_2005) ;
CREATE INDEX voterfile_primary_05_03_2011 ON public.voterfile USING btree (primary_05_03_2011) ;
CREATE INDEX voterfile_primary_05_04_2010 ON public.voterfile USING btree (primary_05_04_2010) ;
CREATE INDEX voterfile_primary_05_05_2009 ON public.voterfile USING btree (primary_05_05_2009) ;
CREATE INDEX voterfile_primary_05_05_2015 ON public.voterfile USING btree (primary_05_05_2015) ;
CREATE INDEX voterfile_primary_05_06_2014 ON public.voterfile USING btree (primary_05_06_2014) ;
CREATE INDEX voterfile_primary_05_07_2002 ON public.voterfile USING btree (primary_05_07_2002) ;
CREATE INDEX voterfile_primary_05_07_2013 ON public.voterfile USING btree (primary_05_07_2013) ;
CREATE INDEX voterfile_primary_05_08_2007 ON public.voterfile USING btree (primary_05_08_2007) ;
CREATE INDEX voterfile_primary_05_08_2018 ON public.voterfile USING btree (primary_05_08_2018) ;
CREATE INDEX voterfile_primary_07_13_2010 ON public.voterfile USING btree (primary_07_13_2010) ;
CREATE INDEX voterfile_primary_09_07_2010 ON public.voterfile USING btree (primary_09_07_2010) ;
CREATE INDEX voterfile_primary_09_08_2009 ON public.voterfile USING btree (primary_09_08_2009) ;
CREATE INDEX voterfile_primary_09_10_2013 ON public.voterfile USING btree (primary_09_10_2013) ;
CREATE INDEX voterfile_primary_09_11_2007 ON public.voterfile USING btree (primary_09_11_2007) ;
CREATE INDEX voterfile_primary_09_12_2017 ON public.voterfile USING btree (primary_09_12_2017) ;
CREATE INDEX voterfile_primary_09_13_2005 ON public.voterfile USING btree (primary_09_13_2005) ;
CREATE INDEX voterfile_primary_09_13_2011 ON public.voterfile USING btree (primary_09_13_2011) ;
CREATE INDEX voterfile_primary_09_13_2016 ON public.voterfile USING btree (primary_09_13_2016) ;
CREATE INDEX voterfile_primary_09_15_2009 ON public.voterfile USING btree (primary_09_15_2009) ;
CREATE INDEX voterfile_primary_09_15_2015 ON public.voterfile USING btree (primary_09_15_2015) ;
CREATE INDEX voterfile_primary_09_29_2009 ON public.voterfile USING btree (primary_09_29_2009) ;
CREATE INDEX voterfile_primary_10_01_2013 ON public.voterfile USING btree (primary_10_01_2013) ;
CREATE INDEX voterfile_primary_10_14_2008 ON public.voterfile USING btree (primary_10_14_2008) ;
CREATE INDEX voterfile_primary_11_06_2007 ON public.voterfile USING btree (primary_11_06_2007) ;
CREATE INDEX voterfile_registration_date ON public.voterfile USING btree (registration_date) ;
CREATE INDEX voterfile_residential_address1 ON public.voterfile USING btree (residential_address1) ;
CREATE INDEX voterfile_residential_city ON public.voterfile USING btree (residential_city) ;
CREATE INDEX voterfile_residential_country ON public.voterfile USING btree (residential_country) ;
CREATE INDEX voterfile_residential_postalcode ON public.voterfile USING btree (residential_postalcode) ;
CREATE INDEX voterfile_residential_secondary_addr ON public.voterfile USING btree (residential_secondary_addr) ;
CREATE INDEX voterfile_residential_state ON public.voterfile USING btree (residential_state) ;
CREATE INDEX voterfile_residential_zip ON public.voterfile USING btree (residential_zip) ;
CREATE INDEX voterfile_residential_zip_plus4 ON public.voterfile USING btree (residential_zip_plus4) ;
CREATE INDEX voterfile_special_02_07_2006 ON public.voterfile USING btree (special_02_07_2006) ;
CREATE INDEX voterfile_special_02_08_2005 ON public.voterfile USING btree (special_02_08_2005) ;
CREATE INDEX voterfile_special_05_06_2003 ON public.voterfile USING btree (special_05_06_2003) ;
CREATE INDEX voterfile_special_05_08_2001 ON public.voterfile USING btree (special_05_08_2001) ;
CREATE INDEX voterfile_state_board_of_education ON public.voterfile USING btree (state_board_of_education) ;
CREATE INDEX voterfile_state_representative_district ON public.voterfile USING btree (state_representative_district) ;
CREATE INDEX voterfile_state_senate_district ON public.voterfile USING btree (state_senate_district) ;
CREATE INDEX voterfile_suffix ON public.voterfile USING btree (suffix) ;
CREATE INDEX voterfile_township ON public.voterfile USING btree (township) ;
CREATE INDEX voterfile_village ON public.voterfile USING btree (village) ;
CREATE INDEX voterfile_voter_status ON public.voterfile USING btree (voter_status) ;
CREATE INDEX voterfile_ward ON public.voterfile USING btree (ward) ;
