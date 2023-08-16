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
select * from product;


-- mysql은 oracle의 rownum 기능이 없다
# mysql subquery
select *
from (
	select @rownum := @rownum+1 as rn,
		a.*
		 from (
			select * from product 
            where PROD_WRITER ='admin'
            order by prod_id desc
		) as a, (select @rownum := 0) as b
) as c
where rn > 10 and rn <= 20;


# mysql limit
select * from product 
# where prod_writer = 'admin' 
where prod_name like concat('%','test','%')
and prod_content like concat('%','1','%')
and prod_enddate >=  '2023-06-15'
and prod_enddate <=  '2023-07-31'
-- order by prod_id desc
order by prod_price desc
limit 0,20; # 데이터의 시작, 반환할 행 갯수

select count(*) from product 
where prod_writer = 'admin';

-- 변환할 수 있지만 굳이 하지 않겠다고 하시네요...
SELECT STR_TO_DATE('20230730164431', '%Y%m%d%H%i%s');
SELECT STR_TO_DATE('2023-06-11', '%Y-%m-%d%H%i%s');









