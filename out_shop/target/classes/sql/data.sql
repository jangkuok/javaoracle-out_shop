select 'insert into OUTER_TB (OUTER_NO, OUTER_TYPE, OUTER_NAME, OUTER_CONTENT, OUTER_PRICE, OUTER_DATE, OUTER_THUMBNAIL_NAME, OUTER_IMAGENAME) 
values ('|| OUTER_NO || ','|| OUTER_TYPE ||',' || OUTER_NAME || ',' || OUTER_CONTENT || ','|| OUTER_PRICE || ',' || OUTER_DATE || ',' || OUTER_THUMBNAIL_NAME || ',' || OUTER_IMAGENAME || ');' 
from OUTER_TB; 















INSERT INTO OUTER_SIZE values(1,'타입',가슴,소매,어깨,총길이,수량,'색상',아웃터번호);
	--색상 : 블랙/화이트/레드/네이비/차콜/아이보리
	INSERT INTO OUTER_SIZE values(1,'S',53,20,44,67,수량,'색상',아웃터번호);
	INSERT INTO OUTER_SIZE values(1,'M',55,22,46,69,수량,'색상',아웃터번호);
	INSERT INTO OUTER_SIZE values(1,'L',57,24,48,71,수량,'색상',아웃터번호);
	INSERT INTO OUTER_SIZE values(1,'XL',61,28,52,75,수량,'색상',아웃터번호);
	INSERT INTO OUTER_SIZE values(1,'FREE',64,50,73,67,수량,'색상',아웃터번호);
INSERT INTO OUTER_PICTURE values(1,'이미지이름',아웃터번호);
	
--예)
INSERT INTO OUTER_TB values(1,'자켓','EL Over Check Jacket','오버핏의 스타일리쉬함으로 연출하실 수 있는 자켓이에요!',66000,
TO_DATE('20180710145641','YYYY-MM-DDHH24MISS'),'EL Over Check Jacket.jpg','EL Over Check Jacket.jpg');
INSERT INTO OUTER_SIZE values(1,'S',53,20,44,67,50,'차콜',1);
INSERT INTO OUTER_SIZE values(2,'M',55,22,46,69,50,'차콜',1);
INSERT INTO OUTER_SIZE values(3,'L',57,24,48,71,50,'차콜',1);
INSERT INTO OUTER_SIZE values(4,'XL',61,28,52,75,50,'차콜',1);
INSERT INTO OUTER_SIZE values(5,'FREE',59,26,50,73,50,'차콜',1);
INSERT INTO OUTER_PICTURE values(1,'EL Over Check Jacket_상세.jpg',1);
--------------------------------------------------------------------
--주문
INSERT INTO ORDER_CHECK values(1,'회원이름','아웃터테이블두번째이미지이름','첫번째상품이름 외 나머지 개수',주문총가격,'주문처리','회원아이디','회원주소','핸드폰번호','이메일','메세지','주문날짜');

--예)
INSERT INTO ORDER_CHECK values(1,'홍길동','EL Over Check Jacket.jpg','EL Over Check Jacket 외 1',110000,
'배송완료','ffffffff','13581 경기도 성남시 분당구 수내로 181, 312동 1201호','01087791763','jangkuok@naver.com',
'빠른배송부탁드립니다.',TO_DATE('20180710145641','YYYY-MM-DDHH24MISS'));

INSERT INTO ORDER_PRODUCT values(1,아웃터번호,'아웃터두번째이미지이름',);
