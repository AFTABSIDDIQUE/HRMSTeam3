USE [team3]
GO

/****** Object:  StoredProcedure [dbo].[LoginProc]    Script Date: 6/16/2025 7:14:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[LoginProc]
@str varchar(100),
@pass varchar(100)
as
begin
	select * from userCreation where (email = @str or fname = @str) and pass=@pass and stat='Active';
end
GO

select * from userCreation;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY IDENTITY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    mobile_num VARCHAR(100),
    dob varchar (100),
    doj varchar(100),
    department VARCHAR(100),
    designation VARCHAR(100),
    manager varchar(100),
    status VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE()
);
ALTER TABLE Employees
ADD emergency_contact VARCHAR(100);
alter table employees add profile_pic varchar (100);

create proc addemp
@fname varchar(100),
@email varchar(100),
@mobnum varchar(100),
@dob varchar(100),
@doj varchar(100),
@dept varchar(100),
@desig varchar(100),
@manager varchar(100),
@status varchar (100)
as
begin
insert into employees(full_name,email,mobile_num,dob,doj,department,designation,manager,status) values (@fname,@email,@mobnum,@dob,@doj,@dept,@desig,@manager,@status);
end


create proc viewpersonaldata
@name varchar (100)
as
begin
select * from employees where email='%'+@name+'%' or full_name like '%'+@name+'%';
end

create proc fetchemp
@id int
as
begin
select * from employees where employee_id = @id;
end
exec fetchemp 1;

alter proc updateEmp
@id int,
@fname varchar(100),
@email varchar(100),
@mobnum varchar(100),
@dob varchar(100),
@doj varchar(100),
@dept varchar(100),
@desig varchar(100),
@manager varchar(100),
@status varchar (100)
as
begin
update employees set full_name=@fname,email=@email,mobile_num=@mobnum,dob=@dob,doj=@doj,department=@dept,designation=@desig,manager=@manager,status=@status where employee_id=@id;
end

CREATE TABLE EmployeeDocuments (
    doc_id INT PRIMARY KEY IDENTITY,
    employee_id INT FOREIGN KEY REFERENCES Employees(employee_id),
    doc_type VARCHAR(100), -- e.g., 'Employm
    file_path VARCHAR(255),
    uploaded_on DATETIME DEFAULT GETDATE()
);
drop table EmployeeDocuments;

create proc docupload
@empid int,
@doctype varchar (100),
@filepath varchar (255)
as
begin
insert into EmployeeDocuments(employee_id,doc_type,file_path) values(@empid,@doctype,@filepath);
end

alter proc updatepersonaldata
@name varchar (100)
as
begin
select * from employees where email='%'+@name+'%' or full_name like '%'+@name+'%';
end

alter proc newpersonaldata
@id int,
@fname varchar(100),
@email varchar(100),
@mobnum varchar(100),
@dob varchar(100),
@doj varchar(100),
@dept varchar(100),
@desig varchar(100),
@manager varchar(100),
@status varchar (100),
@emecontact varchar(100),
@profilepic varchar (100)
as
begin
update employees set full_name=@fname,email=@email,mobile_num=@mobnum,dob=@dob,doj=@doj,department=@dept,designation=@desig,manager=@manager,status=@status,emergency_contact=@emecontact,profile_pic=@profilepic where employee_id=@id;
end

create PROCEDURE GetEmployeeDocumentsByName
    @emp_name VARCHAR(100)
AS
BEGIN
    SELECT 
        e.employee_id,
        e.full_name,
        d.doc_type,
        d.file_path,
        d.uploaded_on
    FROM Employees e
    INNER JOIN EmployeeDocuments d ON e.employee_id = d.employee_id
    WHERE e.full_name like '%'+ @emp_name+'%';
END;

select * from employees;
truncate table employees;
select * from EmployeeDocuments;

alter proc fetchallemp
as 
begin
select * from employees;
end

alter proc sortbydesig
@desig varchar(100)
as
begin
select * from employees where designation=@desig;
end
exec sortbydesig developer;

create proc sortbystatus
@status varchar (100)
as
begin
select * from employees where status=@status;
end

CREATE PROCEDURE sortemp_desc
AS
BEGIN
    SELECT * FROM Employees
    ORDER BY employee_id DESC;
END

CREATE PROCEDURE sortemp_asc
AS
BEGIN
    SELECT * FROM Employees
    ORDER BY employee_id asc;
END
exec sortemp_asc;
select * from userCreation;

create table attendance(
employee_id int foreign key references employees(employee_id),
username varchar(100),
checkin varchar(100),
checkout varchar(100)
);
select * from attendance;
drop table attendance;

create proc fetchidforattendance
@name varchar (100)
as
begin
select * from employees where email='%'+@name+'%' or full_name like '%'+@name+'%';
end
exec fetchidforattendance meet;

create proc checkinadd
@id int,
@name varchar(100),
@checkin varchar (100)
as
begin
insert into attendance(employee_id,username,checkin) values(@id,@name,@checkin);
end

create proc checkoutadd
@id int,
@checkout varchar (100)
as
begin
UPDATE attendance SET checkout = @checkout WHERE employee_id = @id;
end

UPDATE Employees
SET profile_pic = NULL
WHERE employee_id = 5;

truncate table attendance;
select * from attendance;

alter proc searchemp
@search varchar (100)
as
begin
select * from employees where @search is null or CAST(employee_id AS varchar) like '%'+@search+ '%' or
full_name like '%'+@search+'%' or email like '%'+@search+'%' or mobile_num like '%'+@search+'%' or
dob like '%'+@search+'%' or doj like '%'+@search+'%' or department like '%'+@search+'%' or designation like '%'+@search+'%'
or status like '%'+@search+'%';
end

exec searchemp dev;

create proc searchbydate
@startdate varchar (100),
@enddate varchar (100)
as
begin
select * from employees where created_at between @startdate and @enddate;
end

create table tickets(
employee_id int foreign key references employees(employee_id),
name varchar(100),
tik_dept varchar(100),
tik_description varchar (500),
tik_status varchar (100) default  'Pending',
tik_attachment varchar(100),
assinged_to varchar(100));

drop table tickets;

alter proc createticket
@employee_id int,
@name varchar(100),
@tik_dept varchar(100),
@tik_description varchar (500),
@tik_attachment varchar(100)
as
begin
insert into tickets(employee_id,name,tik_dept,tik_description,tik_attachment) values(@employee_id,@name,@tik_dept,@tik_description,@tik_attachment);
end

select * from tickets;
ALTER TABLE tickets ADD closed_by VARCHAR(100);

