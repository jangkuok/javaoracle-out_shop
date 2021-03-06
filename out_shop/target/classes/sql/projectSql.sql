
/* 권한 관리 */
DROP TABLE AUTHORITY;
/* 권한 관리 */
CREATE TABLE AUTHORITY (
	LOGIN_ID VARCHAR2(20) PRIMARY KEY, /* 권한 아이디 */
	LOGIN_PW VARCHAR2(20) NOT NULL, /* 권한 비밀번호 */                                    /**/
	LOGIN_AUTHORITY VARCHAR2(50) NOT NULL /* 권한 */
);
INSERT INTO AUTHORITY values('adminuser','adminuser','ROLE_ADMIN');

/* 회원 */
DROP TABLE MEMBER;
/* 회원 */
CREATE TABLE MEMBER (
	MEMBER_ID VARCHAR2(15) PRIMARY KEY, /* 회원 아이디 */
	PW VARCHAR2(15) NOT NULL, /* 비밀번호 */
	NAME VARCHAR2(15) NOT NULL, /* 이름 */
	EMAIL VARCHAR2(30) NOT NULL, /* 이메일 */
	PHONENUM VARCHAR2(12) NOT NULL, /* 핸드폰 번호 */
	ZIPCODE VARCHAR2(100) NULL, /* 우편번호 */
	ADDRESS VARCHAR2(1000) NULL, /* 주소 */
	ADDRESS2 VARCHAR2(100) NULL, /* 주소2 */
	SEX VARCHAR2(10) NOT NULL,
	GRADE VARCHAR2(15) DEFAULT '브론즈' NOT NULL, /* 등급 */
	enabled NUMBER(5) DEFAULT 1 NOT NULL,
	CONSTRAINT MEMBER_LOGIN_ID_FK FOREIGN KEY(MEMBER_ID) REFERENCES AUTHORITY(LOGIN_ID)  
);

/* 관리자 */
DROP TABLE ADMIN;
/* 관리자 */
CREATE TABLE ADMIN (
	ADMIN_ID VARCHAR2(15) PRIMARY KEY, /* 관리자 아이디 */
	PW VARCHAR2(15) NOT NULL, /* 비밀번호 */
	NAME VARCHAR2(15) NOT NULL, /* 이름 */
	ADMIN_AUTHORITY VARCHAR2(50), /* 권한*/
	CONSTRAINT ADMIN_LOGIN_ID_FK FOREIGN KEY(ADMIN_ID) REFERENCES AUTHORITY(LOGIN_ID)
);

INSERT INTO ADMIN values('adminuser','adminuser','adminuser','ROLE_ADMIN');

/* 아웃터 */
DROP TABLE OUTER_TB;
/* 아웃터 */
CREATE TABLE OUTER_TB (									 ----------
	OUTER_NO NUMBER(10) PRIMARY KEY, /* 아웃터 번호 */
	OUTER_TYPE VARCHAR2(100) NOT NULL, /* 아웃터 종류 */
	OUTER_NAME VARCHAR2(100) NOT NULL, /* 아웃터 이름 */         ----------
	OUTER_CONTENT VARCHAR2(1000) NOT NULL, /* 아웃터 내용 */
	OUTER_PRICE NUMBER(10) NOT NULL, /* 아웃터 가격 */
	OUTER_TOTAL_SIZE VARCHAR2(1000),
	OUTER_TOTAL_COLOR VARCHAR2(1000),
	OUTER_TOTAL_AMOUNT NUMBER(10),
	OUTER_DATE DATE,/* 등록날짜 */
	OUTER_THUMBNAIL_NAME VARCHAR(500) NOT NULL, 
	OUTER_IMAGENAME VARCHAR2(500) NOT NULL /* 사진 이름 */
);	


 
DROP SEQUENCE OUTER_NO;
CREATE SEQUENCE OUTER_NO INCREMENT BY 1 START WITH 1;  
select OUTER_NO.nextval from dual

/* 아웃터 사이즈 */
DROP TABLE OUTER_SIZE;
/* 아웃터 사이즈 */
CREATE TABLE OUTER_SIZE (									 ----------
	SIZE_NO NUMBER(10) PRIMARY KEY, /* 사이즈 번호 */
	SIZE_TYPE VARCHAR2(10) NOT NULL,/* 사이즈 수치*/
	CHEST NUMBER(10) NOT NULL, /* 가슴 */
	SLEEVE NUMBER(10) NOT NULL, /* 소매 */
	SHOULDER NUMBER(10) NOT NULL, /* 어깨 */
	WHOLE NUMBER(10) NOT NULL, /* 총길이 */
	AMOUNT NUMBER(10) NOT NULL, /* 수량 */
	COLOR VARCHAR2(20) NOT NULL, /* 색상 */
	OUTER_NO NUMBER(10), /* 아웃터 번호 */
	CONSTRAINT OUTER_SIZE_O_NO_FK FOREIGN KEY(OUTER_NO) REFERENCES OUTER_TB ON DELETE CASCADE
);	

DROP SEQUENCE SIZE_NO;
CREATE SEQUENCE SIZE_NO INCREMENT BY 1 START WITH 1;

/* 아웃터 사진 */
DROP TABLE OUTER_PICTURE;
/* 아웃터 사진 */
CREATE TABLE OUTER_PICTURE (
	PICTURE_NO NUMBER(10) PRIMARY KEY, /* 사진 번호 */
	PICTURE_NAME VARCHAR(500) NOT NULL, /* 사진 이름 */
	PICTURE_URL VARCHAR(1000) NOT NULL, /* 사진 이름 */
	OUTER_NO NUMBER(10) NOT NULL, /* 아웃터 번호 */
	CONSTRAINT PICTURE_OUTER_NO_FK FOREIGN KEY(OUTER_NO) REFERENCES OUTER_TB ON DELETE CASCADE
);

DROP SEQUENCE PICTURE_NO;
CREATE SEQUENCE PICTURE_NO INCREMENT BY 1 START WITH 1;


/* 리뷰 */
DROP TABLE REVIEW;
/* 리뷰 */
CREATE TABLE REVIEW (
	REVIEW_NO NUMBER(10) PRIMARY KEY, /* 리뷰 번호 */
	REVIEW_SUBJECT VARCHAR2(100) NOT NULL, /* 제목 */
	REVIEW_CONTENT VARCHAR2(1000) NOT NULL, /* 내용 */
	PICTURE_NAME VARCHAR2(500), /* 사진 */
	THUMBNAIL_NAME VARCHAR2(500),
	STAR NUMBER(5) NOT NULL, /* 별점 */
	REVIEW_DATE DATE DEFAULT SYSDATE NOT NULL, /* 작성일 */
	MEMBER_ID VARCHAR2(15) NOT NULL, /* 회원 아이디 */
	OUTER_NO NUMBER(10) NOT NULL, /* 아웃터 번호 */
	CONSTRAINT REVIEW_MEMBER_ID_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER ON DELETE CASCADE,
	CONSTRAINT REVIEW_OUTER_NO_FK FOREIGN KEY(OUTER_NO) REFERENCES OUTER_TB ON DELETE CASCADE
);
DROP SEQUENCE REVIEW_NO;
CREATE SEQUENCE REVIEW_NO INCREMENT BY 1 START WITH 1;

/* 즐겨찾기 */
DROP TABLE WISHLIST;
/* 즐겨찾기 */
CREATE TABLE WISHLIST (
	WISH_NO NUMBER(10) PRIMARY KEY, /* 즐겨찾기 번호 */
	MEMBER_ID VARCHAR2(15), /* 회원 아이디 */
	OUTER_NO NUMBER(10), /* 아웃터 아이디 */
	CONSTRAINT WISHLIST_MEMBER_ID_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER ON DELETE CASCADE,
	CONSTRAINT WISHLIST_OUTER_NO_FK FOREIGN KEY(OUTER_NO) REFERENCES OUTER_TB ON DELETE CASCADE
);

DROP SEQUENCE WISH_NO;
CREATE SEQUENCE WISH_NO INCREMENT BY 1 START WITH 1;


/* 주문관리 */
DROP TABLE ORDER_CHECK;
/* 주문관리 */
CREATE TABLE ORDER_CHECK (
	ORDER_NO NUMBER(10) PRIMARY KEY, /* 주문번호 */
	
	ORDER_MEMBER_NAME VARCHAR2(100) NOT NULL,
	ORDER_THUMBNAIL_NAME VARCHAR2(500) NOT NULL,
	ORDER_NAME VARCHAR2(100) NOT NULL,
	
	TOTAL_PRICE NUMBER(10) NOT NULL, /* 결제 금액 */
	HANDLING VARCHAR2(20) NOT NULL, /* 처리 */
	---------------------------------
	MEMBER_ID VARCHAR2(15) NOT NULL, /* 회원 아이디 */
	ADDRESS VARCHAR2(1000) NOT NULL, /* 주소 */
	PHONENUM VARCHAR2(100) NOT NULL, /* 핸드폰 번호 */
	EMAIL VARCHAR2(300) NOT NULL, /* 이메일 */
	MESSAGE VARCHAR2(2000), /* 메세지 */
	ORDER_DATE DATE /* 주문 날짜 */
);
DROP SEQUENCE ORDER_NO;
CREATE SEQUENCE ORDER_NO INCREMENT BY 1 START WITH 1;

/* 주문상품 */
DROP TABLE ORDER_PRODUCT;
/* 주문상품 */
CREATE TABLE ORDER_PRODUCT (
	PRODUCT_NO NUMBER(10) PRIMARY KEY, /* 상품번호 */
	OUTER_NO NUMBER(10) NOT NULL, /* 상품번호 */
	PRODUCT_THUMBNAIL_NAME VARCHAR2(500) NOT NULL,
	PRODUCT_NAME VARCHAR2(100) NOT NULL, /* 이름 */
	PRODUCT_COLOR VARCHAR2(20) NOT NULL, /* 색상 */
	PRODUCT_SIZE VARCHAR2(20) NOT NULL, /* 사이즈 */
	PRODUCT_PRICE NUMBER(10) NOT NULL, /* 가격 */
	ORDER_NO NUMBER(10), /* 주문관리 번호 */
	CONSTRAINT PRODUCT_ORDER_NO_FK FOREIGN KEY(ORDER_NO) REFERENCES ORDER_CHECK ON DELETE CASCADE
);
DROP SEQUENCE PRODUCT_NO;
CREATE SEQUENCE PRODUCT_NO INCREMENT BY 1 START WITH 1;

