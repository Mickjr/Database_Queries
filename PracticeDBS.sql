select count(*) from msa_raw;

alter table msa_jobs
add primary key(jobId);

alter table msa_areas
add primary key(areaId);

alter table msa_states
add primary key(state);

alter table msa_facts
add primary key(jobId,areaID,calendarYear);

ALTER TABLE msa_facts
ADD CONSTRAINT FK_jobId 
FOREIGN KEY(jobId) REFERENCES msa_jobs(jobId) on
delete cascade on update cascade;

ALTER TABLE msa_facts
ADD CONSTRAINT FK_areaId 
FOREIGN KEY(areaId) REFERENCES msa_areas(areaId) on
delete cascade on update cascade;

ALTER TABLE msa_areas
ADD CONSTRAINT FK_state
FOREIGN KEY(areaState) REFERENCES msa_states(state) on
delete cascade on update cascade;

ALTER TABLE msa_jobs
ADD UNIQUE (jobName);

ALTER TABLE msa_areas
ADD UNIQUE (areaName);

insert into msa_states (state)(
select distinct state
from msa_raw
where state != ''
and state is not null);

select count(*) from msa_states;

insert into msa_areas (areaId,areaName,areaState)(
select distinct areaID, areaName, state
from msa_raw
where state != ''
and state is not null
and areaName != ''
and areaName is not null);

insert into msa_jobs (jobId,jobName,jobLevel)(
select distinct jobID, jobName, jobLevel
from msa_raw
where jobName != ''
and jobName is not null);

insert into msa_facts
(jobID,areaId,calendarYear,employed,employedError,jobsperk,hourlyMean,annualMean,meanError,hourlyMedian,annualOnly,hourlyOnly)
select distinct jobID, areaId, calendarYear,employed,employedError,jobsperk,hourlyMean,annualMean,meanError,hourlyMedian,annualOnly,hourlyOnly
from msa_raw
where jobName != ''
and jobName is not null
and state != ''
and state is not null
and areaName != ''
and areaName is not null;

select count(*) from msa_facts;

select jobId, `jobName`from msa_jobs;

create view msa_jobs_total as
select jobId, jobName
from msa_jobs
where jobLevel = 'total';

create view msa_jobs_major as
select jobId, jobName
from msa_jobs
where jobLevel = 'major';

create view msa_jobs_detail as
select jobId, jobName
from msa_jobs
where jobLevel = ''
or jobLevel is null;

create view msa_facts_detail as
select msa_facts.jobId, jobName, areaId, calendarYear,
employedError, jobsperk,hourlyMean,annualMean,meanError, employed
from msa_jobs_detail
join msa_facts on msa_facts.jobId = msa_jobs_detail.jobId;

create view msa_facts_detail_area as
select jobId, jobName, msa_areas.areaId, calendarYear,
employedError, jobsperk,hourlyMean,annualMean,meanError,areaName,areaState,employed
from msa_facts_detail
join msa_areas on msa_areas.areaId = msa_facts_detail.areaId;

select calendarYear, sum(employed) as employed
from msa_facts_detail_area
group by calendarYear;


select calendarYear, 
avg(annualMean) as AvgAnnual,
 sum(employed * annualMean)/1000000000000 as TotalWages
from msa_facts_detail_area
group by calendarYear;

select jobId,jobName,
 max(annualMean), min(annualMean), avg(annualMean) as avgMean
from msa_facts_detail_area
where jobId like '15%'
and calendarYear = '2009'
and areaState = 'FL'
group by jobId, jobName
having avgMean >= 60000
order by avgMean desc;

select *
from msa_facts
join( 
select jobId, jobName
from msa_jobs
where jobLevel = ''
or jobLevel is null)
as msa_jobs_detail
on msa_facts.jobId = msa_jobs_detail.jobId;


select *
from msa_facts
join( 
select jobId, jobName
from msa_jobs
where jobLevel = ''
or jobLevel is null)
as msa_jobs_detail
on msa_facts.jobId = msa_jobs_detail.jobId
join(
select areaId, areaState from msa_areas 
where areaState = 'FL')
as st on st.areaId = msa_facts.areaId;

select jobId, jobName
from msa_jobs
where jobId like '15%';

select jobId,jobName,(
select avg(annualMean)
from msa_facts
join msa_areas on msa_facts.areaId = msa_areas.areaId
where areaState = 'FL'
and calendarYear = 2009
and jobId = msa_jobs.jobID
) as ams
from msa_jobs
where jobId like '15%'
having ams >= 60000
order by ams desc;

select count(*) from msa_facts_detail;

select count(*) from msa_facts_detail_area;