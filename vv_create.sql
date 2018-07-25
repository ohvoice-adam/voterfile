REFRESH MATERIALIZED VIEW vote_verify;
CREATE MATERIALIZED VIEW IF NOT EXISTS public.vote_verify AS
 SELECT v.sos_voterid,
    v.first_name,
    v.middle_name,
    v.last_name,
    v.suffix,
    extract(year from v.date_of_birth) as birth_year,
    concat(first_name, ' ', middle_name, ' ', last_name, ' ', suffix, '
', v.residential_address1, ' ', v.residential_secondary_addr, '
', v.residential_city, ' ', v.residential_state, ' ', v.residential_zip, '
', concat('Date of Birth: ', TO_CHAR( v.date_of_birth, 'Mon DD, YYYY' ))) AS address,
    c.county,
    v.congressional_district,
    v.voter_status
   FROM voterfile v
     LEFT JOIN counties c ON cast(v.county_number as smallint) = c.number
    order by county asc, last_name asc, first_name asc;

CREATE INDEX gin_metaphone_all_last_new_idx ON public.vote_verify USING gin (((county)::text), metaphone((first_name)::text, 4), metaphone((last_name)::text, 8) gin_trgm_ops);
CREATE INDEX btree_upper_concat_name_idx ON public.vote_verify USING btree (upper((((county)::text || (last_name)::text) || (first_name)::text)));
CREATE INDEX btree_middle_name_idx ON public.vote_verify USING btree (middle_name);
CREATE INDEX birth_year_idx on public.vote_verify USING btree (birth_year);
