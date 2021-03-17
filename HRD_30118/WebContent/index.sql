create table mem_tbl_book (
	custno number(6) not null primary key,
	custname varchar2(20),
	joindate date,
	grade char(1) check(grade in ('A', 'B', 'C')),
	address varchar2(60)
)
drop table mem_tbl_book;
insert into MEM_TBL_BOOK values (10001, '박정희', '20190215', 'A', '경기 분당구 서현동');
insert into MEM_TBL_BOOK values (10002, '최선한', '20190315', 'B', '경기 군포시 산본동');
insert into MEM_TBL_BOOK values (10003, '김순애', '20190417', 'A', '경기 군포시 산본동');
insert into MEM_TBL_BOOK values (10004, '최정현', '20191219', 'B', '경기 분당구 정자동');
insert into MEM_TBL_BOOK values (10005, '김영림', '20200215', 'A', '경기 분당구 정자동');
insert into MEM_TBL_BOOK values (10006, '박세영', '20200215', 'C', '경기 용인시 용인동');

SELECT * FROM MEM_TBL_BOOK;


create table rent_tbl_book(
	custno number(6) not null,
	bookno number(4) not null,
	rentdate date,
	returndate date,
	CONSTRAINT pk PRIMARY KEY(custno, bookno)
)

insert into rent_tbl_book values (10001, 1234, '20190215', '20190215');
insert into rent_tbl_book values (10001, 1122, '20190215', '20190216');
insert into rent_tbl_book values (10002, 1234, '20190315', '20190215');
insert into rent_tbl_book values (10003, 1234, '20190417', '20190215');
insert into rent_tbl_book values (10004, 1122, '20191219', '20190215');
insert into rent_tbl_book values (10005, 1122, '20200215', '20190215');
insert into rent_tbl_book values (10005, 1113, '20190215', '20190215');
insert into rent_tbl_book values (10005, 1114, '20190215', '20190215');
insert into rent_tbl_book values (10006, 1113, '20200215', '20190215');

drop table rent_tbl_book;
select * from rent_tbl_book;



