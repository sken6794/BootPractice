############################파일업로드 테이블############################
CREATE TABLE PRODUCT_UPLOAD (
	UPLOAD_NO INT PRIMARY KEY auto_increment,
	FILENAME varchar(100) not null, ##실제파일명
	FILEPATH varchar(100) not null, ##폴더명
	UUID varchar(50) not null, ##UUID명
	REGDATE TIMESTAMP default now(),
	PROD_ID INT, ##FK
	PROD_WRITER VARCHAR(20) ##FK
);

select max(prod_id) from product where prod_writer = 'admin';
select * from product_upload where prod_id = 407;

create table test (
	title varchar(40),
    start varchar(20),
    end varchar(20)
);
select * from test;
insert into test values (
	'테스트1', '2023-08-05','2023-08-11'
);
insert into test values (
	'테스트2', '2023-08-06','2023-08-10'
);
insert into test values (
	'테스트3', '2023-08-07','2023-08-11'
);
insert into test values (
	'테스트4', '2023-08-01','2023-08-05'
);
################################################################
create table reservation (
	res_num int primary key auto_increment,
    res_name varchar(20),
    res_phone varchar(40),
    res_startdate varchar(20),
    res_enddate varchar(20),
    res_price int (30),
    res_users int(20),
    user_id varchar(30),
    room_num int,
    bn_id varchar(20)
);

## 더미데이터
insert into reservation ( ## 1
	res_name, res_phone, res_startdate, res_enddate, res_price, res_users, user_id, room_num, bn_id  
) values (	'김민철', '010-1234-4567', '2023-08-05', '2023-08-07', 80000, 2, 'dddd456', 1, 'admin');

insert into reservation (## 2
	res_name,    res_phone,     res_startdate, res_enddate, res_price,   res_users, user_id,  room_num  , bn_id  
    ) values ('석이서',    '010-4654-4567', '2023-08-10', '2023-08-12', 90000, 2, 'asd123', 1,'admin'
);

insert into reservation (## 3
	res_name,  res_phone,   res_startdate, res_enddate, res_price,   res_users, user_id,  room_num  , bn_id  
) values ('박수정',  '010-6218-4567',  '2023-08-15', '2023-08-19', 120000, 2, 'dddd1185',  1 ,'admin'
);

insert into reservation ( ## 4
	res_name, res_phone,  res_startdate, res_enddate, res_price,   res_users, user_id,  room_num  , bn_id  
) values ('손가영', '010-7859-4567', '2023-09-05', '2023-09-08', 160000, 2, 'asdqwe123', 1 ,'admin'
);

insert into reservation ( ## 5
	res_name,  res_phone,  res_startdate, res_enddate, res_price, res_users, user_id, room_num  , bn_id  
) values ('김혜민', '010-1234-8855', '2023-08-11', '2023-08-15', 160000, 2, 'qwed0811', 1 ,'admin'
);

insert into reservation ( ## 6
	res_name, res_phone, res_startdate, res_enddate, res_price, res_users, user_id, room_num, bn_id  ) values (
	'김자바', '010-1234-8855', '2023-09-11', '2023-09-15', 160000, 2, 'asdgg',  3 ,'admin'
);
insert into reservation ( ## 7
	res_name, res_phone, res_startdate, res_enddate, res_price, res_users, user_id, room_num, bn_id  ) values (
	'신용권', '010-4352-8855', '2023-09-20', '2023-09-22', 160000, 2, 'fgre22',  4 ,'admin'
);
insert into reservation ( ## 8
	res_name, res_phone, res_startdate, res_enddate, res_price, res_users, user_id, room_num, bn_id  ) values (
	'아무개', '010-7545-8855', '2023-10-01', '2023-10-03', 160000, 2, 'ngng43434',  5 ,'admin'
);
insert into reservation ( ## 9
	res_name, res_phone, res_startdate, res_enddate, res_price, res_users, user_id, room_num, bn_id  ) values (
	'슬리퍼', '010-5475-8855', '2023-10-07', '2023-10-10', 160000, 2, 'qqwes222',  6 ,'admin'
);
insert into reservation ( ## 10
	res_name, res_phone, res_startdate, res_enddate, res_price, res_users, user_id, room_num, bn_id  ) values (
	'초코우유', '010-1343-8855', '2023-10-31', '2023-11-02', 160000, 2, 'bgfb2323',  7 ,'admin'
);
select * from reservation;
####################################
select count(*) as total from reservation where bn_id = 'admin';
###########################################
## 숙박 1
create table lodgment (
	lodg_num int primary key auto_increment,
    lodg_type varchar(20),
    lodg_name varchar(40),
    lodg_rg varchar(40),
    lodg_addr varchar(200),
    lodg_img_filename varchar(100),
    lodg_img_filepath varchar(100),
    lodg_img_uuid varchar(100),
    lodg_ph varchar (30),
    lodg_content varchar(1000),
    bn_id varchar(20)
);
select * from lodgment where lodg_num = 1;
#############################################
## 객실 2 
create table room (
	room_num int primary key auto_increment,
    room_name varchar(20),
    room_price varchar(40),
    room_detail varchar(1000),
    room_users int,
    lodg_num int    
);

select * from room;
select room_num from room order by room_num desc;
#################################################
## 객실 이미지
create table room_img (
	ro_img_num int primary key auto_increment,
    ro_img_filename varchar(20),
    ro_img_filepath varchar(40),
    ro_img_uuid varchar(50),
    ro_img_regdate timestamp DEFAULT NOW(),
    room_num int
);
select * from room_img;
select * from room_img where room_num = 3;

select * from room;

select * from room r  
right join room_img i  
on r.room_num = i.room_num;


select res.*,ro.room_name,l.lodg_name from reservation res
join room ro 
on res.room_num = ro.room_num
join lodgment l
on ro.lodg_num = l.lodg_num
where res.bn_id = 'admin'
order by res.res_num desc;

select * from reservation;
select * from room;
select * from lodgment;

select lo.lodg_num, ro.room_num from lodgment lo
join room ro
on ro.lodg_num = lo.lodg_num
where lo.lodg_num = 1;
select * from reservation;
###############################################################
create table business (
	bn_id varchar(20),
    bn_pw varchar(20),
    bn_name varchar(40),
    bn_title varchar(50),
    bn_num varchar(50),
    bn_phone varchar (30)    
);

create table review (
	rev_num int primary key auto_increment,
    rev_regdate timestamp DEFAULT NOW(),
    rev_content varchar(40),
    rev_star varchar(50),
    room_num int
);

create table userservice (
	ask_num int primary key auto_increment,
    ask_regdate timestamp DEFAULT NOW(),
    ask_content varchar(1000),
    answer_check CHAR(1) DEFAULT 'n' CHECK (answer_check IN ('y', 'n')), ##체크제약
    user_id varchar(30),
    room_num int
);

## 고객 서비스 답변 10
create table serviceanswer (
	answer_num int primary key auto_increment,
    answer_content varchar(1000),
    ask_num int
);
##################################################
select * from reservation res
		join room ro
		on res.room_num = ro.room_num
		join lodgment l
		on ro.lodg_num = l.lodg_num
		where res.bn_id = 'admin'
        order by res.res_num desc
		limit 0,5;
select count(*) as total from reservation where bn_id = 'admin';
