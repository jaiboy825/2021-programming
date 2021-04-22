create table personnel(
	id char(2) not null primary key,
	name varchar2(30) not null,
	dept varchar2(20) not null,
	position char(1),
	duty varchar2(20),
	phone varchar2(14)
);
drop table personnel;
select * from personnel;

select * from personnel where id = '95';
select * from personnel where dept = '경리부';

insert into personnel values('95', '박민우', '인사부', '1', '상무', '010-1234-5678');
insert into personnel values('96', '홍길동', '경리부', '2', '과장', '010-3333-4444');
insert into personnel values('97', '홍길동', '경리부', '2', '과장', '010-3333-5555');
insert into personnel values('98', 'ㅇㅇ', '경리부', '2', '과장', '010-3333-5555');

update personnel set name = '이유진', dept = '기획부', position = '2', duty = '상무', phone = '010-3760-2930'  where id = 96;

delete from personnel where id = 97 and name = '홍';