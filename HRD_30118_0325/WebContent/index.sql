create table employee_tbl (
	empno number(5) not null primary key,
	empname varchar2(20),
	joindate date,
	rank char(1) check (rank in ('A', 'B','C')),
	dept char(1) check (dept in ('A', 'B', 'C'))
)

insert into employee_tbl values(10001, '고영만', '2017-03-01', 'A', 'A');
insert into employee_tbl values(10002, '만준원', '2017-03-01', 'A','B');
insert into employee_tbl values(10003, '원성휘', '2017-03-01','B','A');
insert into employee_tbl values(10004, '휘현진', '2015-05-01','B','B');
insert into employee_tbl values(10005, '진유민', '2015-05-01','C','C');

create table salary_tbl (
	empno number(5) not null,
	payday date not null,
	pay number(10),
	CONSTRAINT pk PRIMARY KEY (empno, payday)
)
drop table salary_tbl;
insert into salary_tbl values(10001,'2019-03-01',1540000);
insert into salary_tbl values(10001,'2019-04-01',1570000);
insert into salary_tbl values(10002,'2019-03-01',1740000);
insert into salary_tbl values(10002,'2019-04-01',1770000);
insert into salary_tbl values(10003, '2019-03-01',2400000);
insert into salary_tbl values(10003,'2019-04-01',2450000);
insert into salary_tbl values(10004,'2019-03-01', 3400000);
insert into salary_tbl values(10004,'2019-04-01', 3450000);
insert into salary_tbl values(10005,'2019-03-01', 4500000);
insert into salary_tbl values(10005,'2019-04-01', 4550000);
select a.empno, a.empname, sum(b.pay) from employee_tbl a, salary_tbl b where a.empno = b.empno group by a.empno, a.empname order by sum(b.pay) desc, a.empno asc;

select a.empno, a.empname, sum(pay) pay from employee_tbl a, salary_tbl b wher
drop table employee_tbl;
select * from employee_tbl;