#!/bin/bash

source db.conf

LASTDATE=$(tail -2 updateDates.txt | head -1)
TODAY=$(date +%Y%m%d)

psql -c "alter table voterfile rename to voterfile_$LASTDATE;"
psql -c "alter table voterfile_new rename to voterfile;"

psql -c "alter table vote_verify rename to vote_verify_$LASTDATE;"
psql -c "alter table vote_verify_new rename to vote_verify;"

psql -c "grant select on table public.vote_verify to ohiovotes;"
psql -c "grant select on table public.voterfile to ohiovotes;"

psql -c "insert into numbers (date_updated, active, confirmation, total) select CURRENT_TIMESTAMP, count(*) filter (where voter_status = 'ACTIVE'), count(*) filter (where voter_status= 'CONFIRMATION'), count(*) from voterfile;"

