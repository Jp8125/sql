USE mod1
GO
CREATE SCHEMA DEPT
GO
CREATE TABLE DEPT.cars(car_id int PRIMARY KEY
,price int not null
,model_name varchar(40))

CREATE TABLE DEPT.inventory (
inventory_id int PRIMARY KEY
,[location] VARCHAR(50) not null
,car_id int
,FOREIGN KEY (car_id) REFERENCES DEPT.cars(car_id)
)

CREATE TABLE DEPT.employee(
emp_id int PRIMARY KEY
,emp_name varchar(100)
,jd Date
,emp_address varchar(120)
,salary int
,car_id int
,CONSTRAINT emp_fk FOREIGN KEY (car_id) REFERENCES DEPT.cars(car_id)
)
insert into mod1.DEPT.cars values(1,2000000,'s-cross'),(2,1600000,'Brezza'),(3,1400000,'swift')
INSERT INTO mod1.DEPT.inventory VALUES(1,'ahmedabad',1),(2,'Ghandhinagar',3),(3,'Surat',1)
INSERT INTO mod1.DEPT.employee values(1,'emp1','2023-1-12','kalol',20000,3),(2,'emp2','2023-1-12','kadi',20000,1),(3,'emp3','2023-1-12','gift city',20000,2)
SELECT * FROM mod1.DEPT.employee
SELECT * FROM mod1.DEPT.cars
SELECT * FROM mod1.DEPT.inventory