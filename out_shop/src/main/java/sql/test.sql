CREATE  TABLE users (
  username VARCHAR(45) NOT NULL primary key,
  password VARCHAR(60) NOT NULL,
  enabled number(1) DEFAULT 1
 );

CREATE TABLE user_roles (
  user_role_id number(11) NOT NULL,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  CONSTRAINT fk_username FOREIGN KEY (username) 
     REFERENCES users (username)
 );
 
create sequence user_roles_seq
	start with 1
	increment by 1
	maxvalue 99999
    nocycle 

-- example
-- pw : 123456789
INSERT INTO users(username,password,enabled)
VALUES ('admin','$2a$10$US3HfE49gc5k.2nDwr/a9u1uCg6O8olzJZc5yERG.obR7xveqIHE2', 1);


INSERT INTO user_roles (user_role_id, username, role)
VALUES (user_roles_seq.nextval, 'admin', 'ROLE_ADMIN');


		SELECT 	member_id, pw, 
				name, email,
				phonenum, jumin1, 
				jumin2, zipcode, 
				address, birthday,
				sex, grade, enabled
		FROM MEMBER


create table OUTER_TB (
OUTER_NO number(10,0) not null, 
AMOUNT number(10,0) not null, 
COLOR varchar2(100 char) not null, 
CONTENT varchar2(1000 char) not null, 
NAME varchar2(100 char) not null, 
PRICE number(10,0) not null, 
SIZE varchar2(10 char) not null, 
OUTER_TYPE varchar2(100 char) not null, 
primary key (OUTER_NO))
	SELECT  	s.SIZE_TYPE, s.CHEST,	
				s.SLEEVE, s.SHOULDER, 
				s.WHOLE, s.AMOUNT, s.OUTER_NO,
				c.COLOR_NO, c.COLOR_TYPE, c.SIZE_NO
	FROM		OUTER_SIZE s, COLOR c	
	WHERE		s.SIZE_NO = c.SIZE_NO(+)
	AND			s.SIZE_NO = c.SIZE_NO(+)	
	
	
	
	
SELECT 	ORDER_NO, TOTAL_PRICE, HANDLING, MEMBER_ID, ADDRESS, PHONENUM, EMAIL, MESSAGE, ORDER_DATE
FROM ORDER_CHECK	
ORDER BY ORDER_NO DESC;	




SELECT * FROM (
            SELECT  
                   m.*, FLOOR((ROWNUM - 1)/10 + 1) page  
            FROM (  
                     	SELECT		w.WISH_NO, w.MEMBER_ID,
								  	o.OUTER_TYPE, o.OUTER_NAME, 
									o.OUTER_CONTENT, o.OUTER_PRICE, 
									o.OUTER_DATE, o.OUTER_THUMBNAIL_NAME, 
									o.OUTER_IMAGENAME, o.OUTER_NO  
						FROM		WISHLIST w, OUTER_TB o	
						WHERE		w.OUTER_NO = o.OUTER_NO (+) 
						AND			w.MEMBER_ID = 'ffffffff'
                        ORDER BY    w.WISH_NO DESC 
                 ) m  
          	)  
          
 WHERE page = 1;

 

SELECT WISH_NO, MEMBER_ID, OUTER_NAME, OUTER_PRICE, OUTER_THUMBNAIL_NAME
		FROM(
			SELECT ROWNUM RNUM, WISH_NO, MEMBER_ID, OUTER_NAME, OUTER_PRICE, OUTER_THUMBNAIL_NAME
			FROM( 	
                    	SELECT		w.WISH_NO, w.MEMBER_ID,
								  	o.OUTER_NAME, o.OUTER_PRICE, 
									o.OUTER_THUMBNAIL_NAME
						FROM		WISHLIST w, OUTER_TB o	
						WHERE		w.OUTER_NO = o.OUTER_NO (+) 
						AND			w.MEMBER_ID = 'ffffffff'
                        ORDER BY    w.WISH_NO DESC 
				)
			WHERE ROWNUM &lt;= 2
			)
WHERE RNUM>=1;

		SELECT WISH_NO, MEMBER_ID, OUTER_NO
		FROM(
			SELECT ROWNUM RNUM, WISH_NO, MEMBER_ID, OUTER_NO
			FROM( 	
                    	SELECT 	WISH_NO, MEMBER_ID, OUTER_NO
						FROM WISHLIST
						WHERE MEMBER_ID = 'ffffffff'
                        ORDER BY WISH_NO DESC 
				)
			WHERE ROWNUM &lt;= 1
			)
		WHERE RNUM>=1;
SELECT 	OUTER_NO, OUTER_TYPE, 
				OUTER_NAME, OUTER_CONTENT, 
				OUTER_PRICE, OUTER_DATE, 
				OUTER_THUMBNAIL_NAME, OUTER_IMAGENAME
FROM OUTER_TB		
WHERE OUTER_TYPE LIKE '자켓'
ORDER BY OUTER_DATE DESC

	select *
	from ORDER_CHECK
	WHERE to_char(ORDER_DATE,'yyyy-mm-dd') <=	to_char(sysdate,'yyyy-mm-dd') 
	AND to_char(ORDER_DATE,'yyyy-mm-dd') >= to_char(add_months(sysdate,-1),'yyyy-mm-dd')
	
	SELECT  	r.REVIEW_NO, r.REVIEW_SUBJECT,	
					r.REVIEW_CONTENT, r.PICTURE_NAME, 
					r.THUMBNAIL_NAME, r.STAR, 
					r.REVIEW_DATE, r.MEMBER_ID,
					o.OUTER_TYPE, o.OUTER_NAME, 
					o.OUTER_CONTENT, o.OUTER_PRICE, 
					o.OUTER_DATE, o.OUTER_THUMBNAIL_NAME, o.OUTER_IMAGENAME
		FROM		REVIEW r, OUTER_TB o 	
		WHERE		r.OUTER_NO = o.OUTER_NO(+)
		AND 		r.REVIEW_NO = 9
		
		
		
	SELECT OUTER_NO, COUNT(*)
	FROM ORDER_PRODUCT
	GROUP BY OUTER_NO
	
	SELECT *
	FROM ORDER_PRODUCT
	WHERE ROWNUM  <= 3
	
	
	--상품별 한달 판매량
	SELECT 	SUM(p.PRODUCT_PRICE) MONTH_PRICE, p.PRODUCT_NAME PRODUCT_NAME
	FROM 	ORDER_CHECK c, ORDER_PRODUCT p
	WHERE   c.ORDER_NO = p.ORDER_NO 
	AND		(c.HANDLING = '주문완료' OR c.HANDLING = '배송완료')	
	AND		to_char(c.ORDER_DATE,'yyyy-mm-dd') <= to_char(SYSDATE,'yyyy-mm-dd')
	AND		ROWNUM  <= 20
	GROUP BY p.PRODUCT_NAME
	ORDER BY MONTH_PRICE DESC
	
	--한달 총 판매량
	SELECT 	SUM(TOTAL_PRICE) MONTH_PRICE
	FROM 	ORDER_CHECK 
	WHERE	(HANDLING = '주문완료' OR 	HANDLING = '배송완료')
	AND		to_char(ORDER_DATE,'yyyy-mm-dd') <= to_char(SYSDATE,'yyyy-mm-dd') 
	
	
	
	
	AND to_char(ORDER_DATE,'yyyy-mm-dd') >= to_char(add_months(sysdate,-1),'yyyy-mm-dd')

