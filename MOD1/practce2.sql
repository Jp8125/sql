use mod1
alter table job_history add CONSTRAINT	fk_jobs_id foreign key(job_id) REFERENCES demo.jobs(job_id)
alter table job_history DROP CONSTRAINT fk_jobs_id
ALTER TABLE job_history ADD [location] varchar(100) ;