

CREATE TABLE PRODUCT(
    PROD_ID INT PRIMARY KEY AUTO_INCREMENT, 	## PK (자동증가값)
    PROD_REGDATE TIMESTAMP DEFAULT NOW(), 	## 등록일 (기본값 시간형)
    PROD_ENDDATE VARCHAR(20),		## 판매종료일 (문자형 시간)
    PROD_CATEGORY VARCHAR(20),		## 카테고리 키
    PROD_WRITER VARCHAR(20),		## 작성자 FK
    PROD_NAME VARCHAR(300),  		## 상품명
    PROD_PRICE INT NOT NULL, 		## 가격
    PROD_COUNT INT NOT NULL, 		## 재고
    PROD_DISCOUNT INT DEFAULT 0, 		## 할인율 (기본값 숫자 0)
    PROD_PURCHASE_YN CHAR(1) DEFAULT 'N' CHECK (PROD_PURCHASE_YN IN ('Y', 'N')), ##체크제약
    PROD_CONTENT VARCHAR(5000), 		##내용
    PROD_COMMENT VARCHAR(5000)		##메모
);
###################################################

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
    lodg_ph int (30),
    lodg_content varchar(1000),
    bn_id varchar(20)
);

## 사업자 2
create table business (
	bn_id varchar(20),
    bn_pw varchar(20),
    bn_name varchar(40),
    bn_title varchar(50),
    bn_num varchar(50),
    bn_phone int (30)    
);

## 예약 3
create table reservation (
	res_num int primary key auto_increment,
    res_name varchar(20),
    res_phone varchar(40),
    res_startdate varchar(20),
    res_enddate varchar(20),
    res_price int (30),
    res_users int(20),
    user_id varchar(30),
    room_num int    
);

## 객실 4
create table room (
	room_num int primary key auto_increment,
    room_name varchar(20),
    room_price varchar(40),
    room_detail varchar(1000),
    lodg_num int    
);

## 객실 이미지 5
create table room_img (
	ro_img_num int primary key auto_increment,
    ro_img_filename varchar(20),
    ro_img_filepath varchar(40),
    ro_img_uuid varchar(50),
    ro_img_regdate timestamp DEFAULT NOW(),
    room_num int
);

## 리뷰 테이블 6
create table review (
	rev_num int primary key auto_increment,
    rev_regdate timestamp DEFAULT NOW(),
    rev_content varchar(40),
    rev_star varchar(50),
    room_num int
);

## 날짜별예약 7
create table date_reservation (
	date_re_num int primary key auto_increment,
    rev_status CHAR(1) DEFAULT 'n' CHECK (rev_status IN ('y', 'n')), ##체크제약
    res_num int
);



## 리뷰 이미지 8
create table rev_img_num (
	rev_img_num int primary key auto_increment,
    rev_img_filename varchar(20),
    rev_img_filepath varchar(40),
    rev_img_uuid varchar(50),
    user_id varchar(30),
    rev_num int
);

## 고객 서비스 9
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

