select * from product
where prod_writer = 'admin'
order by prod_id desc
limit 0,10;

SELECT CONCAT(A1.group_ID, A1.CATEGORY_ID) AS CATEGORY_KEY, ##카테고리 키 (그룹 + 키 형태로 카테고리분류)
 	   CASE A1.category_parent_LV
 	        WHEN 0 THEN A1.category_detail_NM
 			WHEN 1 THEN CONCAT(A2.category_detail_NM,' > ', A1.category_detail_NM)
 			WHEN 2 THEN CONCAT(A3.category_detail_NM, ' > ', A2.category_detail_NM,' > ', A1.category_detail_NM)
 	   END as CATEGORY_NAV
FROM product_category A1
LEFT OUTER JOIN product_category A2
ON A1.CATEGORY_PARENT_LV = A2.CATEGORY_LV AND A1.CATEGORY_DETAIL_PARENT_LV = A2.CATEGORY_DETAIL_LV AND A1.GROUP_ID = A2.GROUP_ID
LEFT OUTER JOIN product_category A3
ON A2.CATEGORY_PARENT_LV = A3.CATEGORY_LV AND A2.CATEGORY_DETAIL_PARENT_LV = A3.CATEGORY_DETAIL_LV
ORDER BY CATEGORY_NAV ASC;

select P1.*,test.category_nav from product P1
LEFT join (SELECT CONCAT(A1.group_ID, A1.CATEGORY_ID) AS CATEGORY_KEY, ##카테고리 키 (그룹 + 키 형태로 카테고리분류)
			CASE A1.category_parent_LV
				WHEN 0 THEN A1.category_detail_NM
				WHEN 1 THEN CONCAT(A2.category_detail_NM,' > ', A1.category_detail_NM)
				WHEN 2 THEN CONCAT(A3.category_detail_NM, ' > ', A2.category_detail_NM,' > ', A1.category_detail_NM)
			END as CATEGORY_NAV
		FROM PRODUCT_CATEGORY A1
		LEFT OUTER JOIN PRODUCT_CATEGORY A2
		ON A1.CATEGORY_PARENT_LV = A2.CATEGORY_LV AND A1.CATEGORY_DETAIL_PARENT_LV = A2.CATEGORY_DETAIL_LV AND A1.GROUP_ID = A2.GROUP_ID
		LEFT OUTER JOIN PRODUCT_CATEGORY A3
		ON A2.CATEGORY_PARENT_LV = A3.CATEGORY_LV AND A2.CATEGORY_DETAIL_PARENT_LV = A3.CATEGORY_DETAIL_LV) as test
on P1.PROD_CATEGORY = test.CATEGORY_KEY 
where prod_writer = 'admin'
order by prod_id desc
limit 0,10;

select * from product a
  		left join (SELECT CONCAT(A1.group_ID, A1.CATEGORY_ID) AS CATEGORY_KEY, ##카테고리 키 (그룹 + 키 형태로 카테고리분류)
						CASE A1.category_parent_LV
							WHEN 0 THEN A1.category_detail_NM
							WHEN 1 THEN CONCAT(A2.category_detail_NM,' > ', A1.category_detail_NM)
							WHEN 2 THEN CONCAT(A3.category_detail_NM, ' > ', A2.category_detail_NM,' > ', A1.category_detail_NM)
						END as CATEGORY_NAV
					FROM product_category A1
					LEFT OUTER JOIN product_category A2
					ON A1.CATEGORY_PARENT_LV = A2.CATEGORY_LV AND A1.CATEGORY_DETAIL_PARENT_LV = A2.CATEGORY_DETAIL_LV AND A1.GROUP_ID = A2.GROUP_ID
					LEFT OUTER JOIN product_category A3
					ON A2.CATEGORY_PARENT_LV = A3.CATEGORY_LV AND A2.CATEGORY_DETAIL_PARENT_LV = A3.CATEGORY_DETAIL_LV
  					) b
		on a.product_category = b.category_key    					
  		