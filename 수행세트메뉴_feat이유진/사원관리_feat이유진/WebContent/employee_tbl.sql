create table employee_tbl(
	empno number(5) not null primary key,
	empname varchar2(20),
	joindate date,
	rank char(1),
	dept char(1)
);
drop table employee_tbl;
select max(empno) from employee_tbl;
select * from employee_tbl where empno = 10002;
select * from employee_tbl;

insert into employee_tbl values(10001, '고영만', '2017-03-01', 'A', 'A');
insert into employee_tbl values(10002, '만준원', '2017-03-01', 'A', 'B');
insert into employee_tbl values(10003, '원성휘', '2017-03-01', 'B', 'A');
insert into employee_tbl values(10004, '휘현진', '2017-03-01', 'B', 'B');
insert into employee_tbl values(10005, '진유민', '2017-03-01', 'C', 'C');

update employee_tbl set empname = 'ㅇㅇㅈ', rank = 'B', dept = 'C' where empno = 10006;

create table salary_tbl(
	empno number(5),
	payday date,
	pay number(10),
	constraint pkey primary key (empno, payday)
);
drop table salary_tbl;
select * from salary_tbl;

insert into salary_tbl values(10001, '2019-03-01', 1540000);
insert into salary_tbl values(10001, '2019-04-01', 1570000);
insert into salary_tbl values(10002, '2019-03-01', 1740000);
insert into salary_tbl values(10002, '2019-04-01', 1770000);
insert into salary_tbl values(10003, '2019-03-01', 2400000);
insert into salary_tbl values(10003, '2019-04-01', 2450000);
insert into salary_tbl values(10004, '2019-03-01', 3450000);
insert into salary_tbl values(10004, '2019-04-01', 3500000);
insert into salary_tbl values(10005, '2019-03-01', 4500000);
insert into salary_tbl values(10005, '2019-04-01', 4550000);
insert into salary_tbl values(10006, '2019-04-01', 0);

select et.empno, empname, sum(pay)
from employee_tbl et, salary_tbl st
where et.empno = st.empno
group by et.empno, empname
order by sum(pay) desc;









