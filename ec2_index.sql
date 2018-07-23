alter table public.voterfile add CONSTRAINT voterfile_pk PRIMARY KEY (sos_voterid);
create index first_name_idx on public.voterfile using btree (first_name);
create index last_name_idx on public.voterfile using btree (last_name);
CREATE INDEX voterfile_county_number ON public.voterfile USING btree (county_number) ;
CREATE INDEX voterfile_date_of_birth ON public.voterfile USING btree (date_of_birth) ;
CREATE INDEX voterfile_age ON public.voterfile USING btree (date_part('year', age(date_of_birth))) ;
CREATE INDEX voterfile_voter_status ON public.voterfile USING btree (voter_status) ;
