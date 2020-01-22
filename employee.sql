create table Department (
	id int identity(1, 1),
	name varchar(100),
	location varchar(100),
	--constraints
	constraint pk_dept primary key(id)
);

create table Employee(
	id int identity(1, 1),
	FirstName varchar(100), 
	LastName varchar(100),
	SSN varchar(10),
	deptId int,
	--constraints
	constraint pk_emp primary key(id),
	constraint fk_dept foreign key(deptId) references Department(id)
);

create table EmpDetails(
	id int identity(1, 1),
	EmployeeId int, 
	Salary money, --yearly
	Address1 varchar(100),
	Address2 varchar(100),
	City varchar(100),
	State varchar(100),
	Country varchar(100)
	--constraints
	constraint pk_emp_details primary key(id),
	constraint fk_emp foreign key(EmployeeId) references Employee(id)
);

--three rows on each table
insert into Department values('HR', '1st floor'), ('Sales', '2nd floor'), ('IT','3rd floor');
insert into Employee values('John','Smith', '123456789', 1), ('Jennifer','Johnson', '987654321', 2), ('Jose', 'Lopez', '567891234', 3);
insert into EmpDetails values(1, 50000.00, '123 Maple St', null, 'Arlington', 'Texas', 'United States'), (2, 60000.00, '345 Main St', null, 'Toronto', 'Ontario', 'Canada'), (3, 55000.00, '1298 Independence St', null,'Cordoba', 'Cordoba', 'Argentina');

--Add tina
insert into Employee values('Tina', 'Smith', '567812309', 1);
insert into EmpDetails values (4, 70000.00, '6549 Oak St',null, 'Reston', 'Virginia', 'United States');

--Add marketing department
insert into Department values ('Marketing', '4th floor');

--List all employees in marketing
update Employee set deptId = 4 where id in(1, 2); --lets have two employees in marketing
select * from Department where name = 'Marketing';
select * from Employee where deptId = 4;

--total salary of marketing
Select Sum(EmpDetails.Salary) from
Department
join Employee
on Department.id = Employee.deptId
join EmpDetails
on Employee.id = EmpDetails.EmployeeId
group by name
having name = 'Marketing';

--total employees by dept
select Count(id) from Employee
group by deptId;

--update tina's salary to 90000
update EmpDetails set Salary = 90000.00 where EmployeeId = 4;
select * from EmpDetails;
