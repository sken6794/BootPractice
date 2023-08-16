-- 타입 명칭
-- 오라클 varchar2(30) -> varchar(30)
-- 오라클 number(10) -> int 
-- date -> timestamp
-- sequence -> auto_increment


-- 제약조건 동일
-- 기본 CRUD문 동일
-- ansi 조인 문 동일
-- 서브쿼리 절 select (select~ ) from 
-- => 서브쿼리절 반드시 서브쿼리절 엘리어스 
-- 함수는 찾아서 사용

select @@autocommit; #오토커밋
set @@autocommit = true;

CREATE TABLE SCORE (
	NUM INT primary KEY auto_increment, #자동 증가값
    NAME VARCHAR(30) NOT NULL,
    KOR VARCHAR(30),
    ENG VARCHAR(30)
);

select * from score order by num desc;
insert into score(name,kor,eng)  values('홍길동','100','100');

update score set kor = '120' where num = 1;
delete from score where num = 1;

create table member (
	id varchar(30) primary key,
    name varchar(30)
);

select * from member;
select * from score;

insert into member (id, name) values ('1234','임영웅');
insert into member (id, name) values ('2345','윤딴딴');
insert into member (id, name) values ('test','이순신');

# N : 1 ( N 이 주 가되는 관계)
select * from score s left join member m on s.name = m.id;
# 1 : N 
select * from member m left join score s on m.id = s.name;

select * from score s left join member m 
  		on s.name= m.id
        where id = 'test';
select * from score;

CREATE TABLE BOARD (
	NUM INT primary KEY auto_increment, #자동 증가값
    NAME VARCHAR(30) NOT NULL,
    title VARCHAR(30),
    content VARCHAR(100),
    etc varchar(30)
);

select * from board;

CREATE TABLE MEMO(
	MNO INT PRIMARY KEY AUTO_INCREMENT,
	MEMO VARCHAR(200) NOT NULL,
	PHONE VARCHAR(30),
	PW VARCHAR(4),
	SECRET CHAR(1) CHECK(SECRET IN ('y', 'n'))
);
select * from memo;
delete from memo where mno = 5;