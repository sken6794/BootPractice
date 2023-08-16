----- 연습용 쿼리들 -----
CREATE TABLE notice(
	bno INT PRIMARY KEY AUTO_INCREMENT, 	## PK (자동증가값)
    regdate TIMESTAMP, 	## 등록일 (기본값 시간형)
    WRITER VARCHAR(20),		## 작성자 FK
    title VARCHAR(300),  		## 상품명
    CONTENT VARCHAR(5000), 		##내용
    hit int(100)
);

select * from notice 
where writer = 'admin'
and title like concat('%','내용','%') 
or content like concat('%','내용','%') 
order by bno
limit 0,10;

select now();
delete from notice where bno = 2;

CREATE TABLE user_prac(
	uno INT PRIMARY KEY AUTO_INCREMENT, 	## PK (자동증가값)
    regdate TIMESTAMP  DEFAULT NOW(), 	## 등록일 (기본값 시간형)
    name VARCHAR(20),		## 작성자 
    pw varchar(10),
    phone varchar(20),
    gender CHAR(1) DEFAULT 'm' CHECK (gender IN ('m', 'f')), ##체크제약
    agree1 CHAR(1) DEFAULT 'y' CHECK (agree1 IN ('y', 'n')), ##체크제약
    agree2 CHAR(1) DEFAULT 'y' CHECK (agree2 IN ('y', 'n')), ##체크제약
    addr1 varchar(30),
    addr2 varchar(30),
    email_first varchar(20),
    email_second varchar(20),
    birth varchar(20),
    CONTENT VARCHAR(5000) 		##내용
);
select * from user_prac;