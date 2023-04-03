--  1
use mod1
create table mod1.dbo.country(country_id int,country_name varchar(80),region_id int,constraint names check(country_name in ('Italy','India','Chaina')))

insert into dbo.country(country_id,country_name,region_id)values(1,'India',4)

alter table mod1.dbo.country add constraint uni unique(country_id,region_id)

select * from dbo.country
--  2
create table job_history(
	employee_id int ,
	start_date varchar(10),
	end_date varchar(10),
	job_id int,
	department_id int not null,
	primary key(employee_id),
	constraint end_date check(end_date like '__/__/____')
)
insert into job_history(employee_id,
	start_date ,
	end_date ,
	job_id,
	department_id )values(2,'15-5-2018','12/02/2022',1,2)
	select * from job_history


--  3
go 
create schema demo
go
create table demo.jobs(
 job_id int 
,job_title varchar(50) default ''
,min_salary int default 8000
,max_salary int default null
primary key(job_id)
)
insert into demo.jobs(job_id) values (1)
select * from demo.jobs
--  4
use mod1
go
create schema employee
go
create table employee.department(dept_id int primary key,dept_name varchar(50),dept_head varchar(50))
INSERT INTO employee.department VALUES (1,'DOTNET',null),(2,'REACT',null),(3,'OPS',null)
create table emp.employee(employee_id int
,first_name varchar(50)
,last_name varchar(50)
,email varchar(100)
,phone_number varchar(50)
,hire_date Date
,job_id int foreign key(job_id) REFERENCES demo.jobs(job_id)
,dept_id int foreign key(dept_id) REFERENCES employee.department(dept_id)
)