CREATE table public.vote_verify_new AS
 SELECT v.sos_voterid,
    v.first_name,
    v.middle_name,
    v.last_name,
    v.suffix,
    extract(year from v.date_of_birth) as birth_year,
    concat(first_name, ' ', middle_name, ' ', last_name, ' ', suffix, '
', v.residential_address1, ' ', v.residential_secondary_addr, '
', v.residential_city, ' ', v.residential_state, ' ', v.residential_zip, '
', concat('Date of Birth: ', extract(year from v.date_of_birth))) AS address,
    c.county,
    v.congressional_district,
    v.voter_status
   FROM voterfile_new v
     LEFT JOIN counties c ON cast(v.county_number as smallint) = c.number
    order by county asc, last_name asc, first_name asc;
