select 'insert into OUTER_TB
values ('|| OUTER_NO || ','''|| OUTER_TYPE ||''','''|| OUTER_NAME ||''','''|| OUTER_CONTENT ||''','|| OUTER_PRICE ||','''|| OUTER_TOTAL_SIZE ||''','''|| OUTER_TOTAL_COLOR ||''',
'''|| OUTER_TOTAL_AMOUNT ||''','|| OUTER_DATE ||','''|| OUTER_THUMBNAIL_NAME ||''','''|| OUTER_IMAGENAME ||''');' 
from OUTER_TB; 

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

select 'insert into OUTER_SIZE values ('|| SIZE_NO || ','''|| SIZE_TYPE ||''','|| CHEST ||','|| SLEEVE ||','|| SHOULDER ||',
'|| WHOLE ||','|| AMOUNT ||','''|| COLOR ||''','|| OUTER_NO ||');' 
from OUTER_SIZE; 

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

select 'insert into OUTER_PICTURE values ('|| PICTURE_NO || ','''|| PICTURE_NAME ||''','''|| PICTURE_URL ||''','|| OUTER_NO ||');' from OUTER_PICTURE; 

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

select 'insert into ORDER_CHECK values ('|| ORDER_NO || ','''|| ORDER_MEMBER_NAME ||''','''|| ORDER_THUMBNAIL_NAME ||''',
'''|| ORDER_NAME ||''','|| TOTAL_PRICE ||','''|| HANDLING ||''','''|| MEMBER_ID ||''',
'''|| ADDRESS ||''','''|| PHONENUM ||''','''|| EMAIL ||''','''|| MESSAGE ||''',
'|| ORDER_DATE ||');' from ORDER_CHECK; 

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

select 'insert into ORDER_PRODUCT values ('|| PRODUCT_NO ||','|| OUTER_NO ||','''|| PRODUCT_THUMBNAIL_NAME ||''',
'''|| PRODUCT_NAME ||''','''|| PRODUCT_COLOR ||''','''|| PRODUCT_SIZE ||''',
'|| PRODUCT_PRICE ||','|| ORDER_NO ||');' from ORDER_PRODUCT; 


------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
insert into OUTER_TB values (7,'자켓','ET 카리나 셔츠 자켓','셔츠디자인과 자켓디자인을 믹스하여 조금더 유니크하고 멋스러운 디자인으로 제작된 셔츠자켓이에요. 두께감도 일반 자켓보다 더 있어서 보온성도 좋은 녀석이에요',
59000,'FREE ','블랙 차콜 네이비',
'60',SYSDATE,'thumb_1531962602755.png','1531962602755.jpg');
insert into OUTER_TB values (2,'자켓','[AWESOME]BL 시크슈트 블레이져','단품으로 따로 추가구입을 원하시는 브로님들의 편의를 위해 블레이져를 따로 진열하였습니다.',
61000,'FREE ','블랙 화이트 네이비 아이보리',
'80',SYSDATE,'thumb_1531962128907.png','1531962128907.jpg');
insert into OUTER_TB values (3,'자켓','EL Over Check Jacket','오버핏의 스타일리쉬함으로 연출하실 수 있는 자켓이에요!
',66000,'FREE ','아이보리 차콜',
'20',SYSDATE,'thumb_1531962228100.png','1531962228100.jpg');
insert into OUTER_TB values (4,'자켓','MC 베크 숏자켓','깔끔한 룩을 원한다면 추천드리는 자켓이에요!! 디자인이 심플해서 어떤옷에도 다잘어올려요!',
66000,'S M L ','블랙 화이트 네이비 ',
'177',SYSDATE,'thumb_1531962294537.png','1531962294537.jpg');
insert into OUTER_TB values (5,'자켓','FA 사파리 숏점퍼','깔끔하지만 스타일리쉬한 디자인으로 제작된 체크패딩
',77000,'FREE ','블랙,차콜,네이비',
'0',SYSDATE,'thumb_1531962399105.png','1531962399105.jpg');
insert into OUTER_TB values (6,'자켓','FA 더블 블레이져','고급스러운 느낌으로 코디를 원하시는 브로님들에게 추천!
',62000,'S M L XL ','블랙 차콜 ',
'160',SYSDATE,'thumb_1531962479569.png','1531962479569.jpg');
insert into OUTER_TB values (8,'자켓','FL 미니멀 오버 라이더','미니멀한 코디룩에 안성맞춤!! 깔끔한 디테일과 매력적인 오버핏으로 무장한 라이더자켓!!',
77000,'S M L XL','블랙 ',
'80',SYSDATE,'thumb_1531962664175.png','1531962664175.jpg');
insert into OUTER_TB values (9,'자켓','ML 라이더 자켓','가장 베이직한 스타일에 견고함을 더하여 제작된 라이더자켓!
',61000,'S M L','블랙 ',
'57',SYSDATE,'thumb_1531963047460.png','1531963047460.jpg');
insert into OUTER_TB values (10,'자켓','CO027 오버 데님자켓','데일리하게 착용하실 수 있는 오버핏의 데님자켓이에요!
',49000,'FREE','네이비',
'0',SYSDATE,'thumb_1531963137233.png','1531963137233.jpg');
insert into OUTER_TB values (11,'자켓','포인트컬러 데님양털자켓','안감은 양털로 보온성은 높게 오렌지컬러의 안감으로 포인트는 확실하게 제작된 데님자켓',
75000,'FREE','네이비',
'20',SYSDATE,'thumb_1531963188074.png','1531963188074.jpg');
insert into OUTER_TB values (12,'코트','36 인터라켄 트렌치코트','정말 고급스럽게 제작된 살짝 오버핏의 코트에요!
',97000,'S M L ','아이보리 블랙 ',
'119',SYSDATE,'thumb_1531963633186.png','1531963633186.jpg');
insert into OUTER_TB values (13,'코트','MV 떡볶이코트','추운겨울에도 착용해보실 수 있도록 압축솜과 퀄팅공법으로 제작된 더플코트',
49000,'FREE ','블랙 네이비 차콜',
'57',SYSDATE,'thumb_1531963726714.png','1531963726714.jpg');
insert into OUTER_TB values (14,'코트','FA 더블 롱 오버핏코트','롱한 길장감과 오버핏의 라인감으로 스타일리쉬한 코디룩을 보여주는 코트',
79000,'FREE ','블랙 네이비 차콜 아이보리',
'78',SYSDATE,'thumb_1531963798489.png','1531963798489.jpg');
insert into OUTER_TB values (15,'코트','JD 이탈리 싱글코트','적당한 두께감과 울소재감으로 보온성도 있으면서 라인감까지 살려서 제작된 코트',
190000,'FREE ','블랙 차콜',
'39',SYSDATE,'thumb_1531963876135.png','1531963876135.jpg');
insert into OUTER_TB values (16,'코트','GR 파노망 오버핏 코트','매력적인 라인감으로 제작된 가오리핏의 완성도높은 코트 ',
95000,'FREE ','블랙,화이트',
'0',SYSDATE,'thumb_1531963950300.png','1531963950300.jpg');
insert into OUTER_TB values (18,'코트','ES 버닝 후드코트','간결한 디자인으로 깔끔한 코디룩을 연출하실 수 있는 후드코트',
124000,'FREE ','블랙 네이비',
'39',SYSDATE,'thumb_1531964516661.png','1531964516661.jpg');
insert into OUTER_TB values (19,'패딩','CL 울체크 셔츠자켓','보는것보다 두께감이 있어서 후드티하나에 이것만 입어도 따뜻해요.셔츠같지만 옆라인에 포켓이 있어서 라인감은 살리고 실용성도 있게 제작되었구요 길이감이나 품이 넉넉해서 안에 맨투맨등 다양하게 코디해도 불편함없어요.',
69000,'FREE ','블랙 네이비 차콜',
'59',SYSDATE,'thumb_1531964569766.png','1531964569766.jpg');
insert into OUTER_TB values (20,'패딩','UN 올림피아 오리털 롱패딩','어떤곳에서도 찾아보시기 힘든 134Cm의 롱한 기장감과 100% 오리털 충전재로 제작된 완성도높은 패딩',
139000,'FREE','블랙',
'20',SYSDATE,'thumb_1531964643900.png','1531964643900.jpg');
insert into OUTER_TB values (21,'패딩','AG 그레이 숏패딩','깔끔한 디자인과 숏한 기장감 그리고 고급덕다운 소재를 사용한 패딩',
11800,'S M L ','블랙 차콜 ',
'120',SYSDATE,'thumb_1531964690977.png','1531964690977.jpg');
insert into OUTER_TB values (22,'패딩','SU 구스패딩 야상','100% 구스 충전재를 사용하여 푹신한 느낌과 빠른 복원력 그리고 높은 보온성을 자랑하며 풍성한 오리지널 라쿤을 사용하여 고급스러움을 더한 오버핏의 패딩야상',
289000,'FREE ','블랙 차콜',
'40',SYSDATE,'thumb_1531964764667.png','1531964764667.jpg');
insert into OUTER_TB values (23,'패딩','FF 리버시블 숏패딩','양면으로 착용해보실 수 있도는 활용도 높은 숏패딩 
',82000,'FREE ','블랙 네이비 화이트',
'60',SYSDATE,'thumb_1531964829832.png','1531964829832.jpg');
insert into OUTER_TB values (24,'가디건','PL 울리치 가디건','울소재로 제작되어 겨울에도 따뜻하게 착용하실 수 있는 소프트 오버핏 가디건 ',
49000,'FREE ','블랙 아이보리',
'19',SYSDATE,'thumb_1531964882912.png','1531964882912.jpg');
insert into OUTER_TB values (26,'가디건','컷팅 오버핏 가디건','매력적인 디자인으로 제작된 오버핏의 니트 가디건 
',49000,'FREE ','블랙 네이비 차콜',
'60',SYSDATE,'thumb_1531965441899.png','1531965441899.jpg');
insert into OUTER_TB values (27,'가디건','RM 울포켓 가디건','심플한 디자인에 위트있는 포켓으로 제작된 울 가디건 ',
56000,'FREE ','블랙 아이보리 차콜 네이비',
'79',SYSDATE,'thumb_1531965538298.png','1531965538298.jpg');
insert into OUTER_TB values (28,'조끼','AR 레인지 패딩조끼','간편하게 즐기실 수 있는 데일리 패딩조끼 ',
27000,'S M L XL','블랙 ',
'79',SYSDATE,'thumb_1531965633657.png','1531965633657.jpg');
insert into OUTER_TB values (1,'자켓','FR 프링 린넨자켓','여름에도 시원하게 즐기실 수 있는 고급소재로 제작된 린넨자켓이에요!',
49000,'S M L ','블랙 아이보리 네이비 ',
'180',SYSDATE,'thumb_1531962018912.png','1531962018912.jpg');
insert into OUTER_TB values (17,'코트','AT 체크 펄펙 오버코트','완성도 높은 오버핏감과 감각적인 패턴으로 제작된 오버코트 ',
89000,'FREE ','블랙 차콜 아이보리',
'60',SYSDATE,'thumb_1531964117831.png','1531964117831.jpg');
insert into OUTER_TB values (25,'가디건','GG 셀링 포인트 가디건','소매와 밑단부분에 배색컬러감으로 디자인된 울 가디건 ',
59000,'S M L XL ','네이비 차콜 아이보리 ',
'120',SYSDATE,'thumb_1531965303766.png','1531965303766.jpg');
insert into OUTER_TB values (100,'자켓','ET 카리나 셔츠 자켓','셔츠디자인과 자켓디자인을 믹스하여 조금더 유니크하고 멋스러운 디자인으로 제작된 셔츠자켓이에요. 두께감도 일반 자켓보다 더 있어서 보온성도 좋은 녀석이에요',
59000,'FREE ','블랙 차콜 네이비',
'60',SYSDATE,'thumb_1531962602755.png','1531962602755.jpg');
insert into OUTER_TB values (50,'자켓','ET 카리나 셔츠 자켓','셔츠디자인과 자켓디자인을 믹스하여 조금더 유니크하고 멋스러운 디자인으로 제작된 셔츠자켓이에요. 두께감도 일반 자켓보다 더 있어서 보온성도 좋은 녀석이에요',
59000,'FREE ','블랙 차콜 네이비',
'60',SYSDATE,'thumb_1531962602755.png','1531962602755.jpg');

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

insert into OUTER_SIZE values (36,'FREE',59,26,50,
73,19,'블랙',7);
insert into OUTER_SIZE values (37,'FREE',59,26,50,
73,19,'차콜',7);
insert into OUTER_SIZE values (38,'FREE',59,26,50,
73,20,'네이비',7);
insert into OUTER_SIZE values (115,'FREE',59,26,50,
73,9,'아이보리',3);
insert into OUTER_SIZE values (116,'FREE',59,26,50,
73,9,'차콜',3);
insert into OUTER_SIZE values (117,'S',53,20,44,
67,20,'블랙',4);
insert into OUTER_SIZE values (118,'M',55,22,46,
69,18,'블랙',4);
insert into OUTER_SIZE values (119,'L',57,24,48,
71,20,'블랙',4);
insert into OUTER_SIZE values (120,'S',53,20,44,
67,20,'화이트',4);
insert into OUTER_SIZE values (121,'M',55,22,46,
69,17,'화이트',4);
insert into OUTER_SIZE values (122,'L',57,24,48,
71,20,'화이트',4);
insert into OUTER_SIZE values (123,'S',53,20,44,
67,19,'네이비',4);
insert into OUTER_SIZE values (124,'M',55,22,46,
69,19,'네이비',4);
insert into OUTER_SIZE values (125,'L',57,24,48,
71,20,'네이비',4);
insert into OUTER_SIZE values (126,'S',53,20,44,
67,20,'블랙',6);
insert into OUTER_SIZE values (127,'M',55,22,46,
69,20,'블랙',6);
insert into OUTER_SIZE values (128,'L',57,24,48,
71,20,'블랙',6);
insert into OUTER_SIZE values (129,'XL',61,28,52,
75,20,'블랙',6);
insert into OUTER_SIZE values (130,'S',53,20,44,
67,20,'차콜',6);
insert into OUTER_SIZE values (131,'M',55,22,46,
69,19,'차콜',6);
insert into OUTER_SIZE values (132,'L',57,24,48,
71,20,'차콜',6);
insert into OUTER_SIZE values (133,'XL',61,28,52,
75,19,'차콜',6);
insert into OUTER_SIZE values (134,'S',53,20,44,
67,20,'블랙',8);
insert into OUTER_SIZE values (135,'M',55,22,46,
69,20,'블랙',8);
insert into OUTER_SIZE values (136,'L',57,24,48,
71,20,'블랙',8);
insert into OUTER_SIZE values (137,'XL',61,28,52,
75,20,'블랙',8);
insert into OUTER_SIZE values (138,'S',53,20,44,
67,19,'블랙',9);
insert into OUTER_SIZE values (139,'M',55,22,46,
69,19,'블랙',9);
insert into OUTER_SIZE values (140,'L',57,24,48,
71,19,'블랙',9);
insert into OUTER_SIZE values (141,'S',53,20,44,
67,19,'아이보리',12);
insert into OUTER_SIZE values (142,'M',55,22,46,
69,20,'아이보리',12);
insert into OUTER_SIZE values (143,'L',57,24,48,
71,20,'아이보리',12);
insert into OUTER_SIZE values (144,'S',53,20,44,
67,20,'블랙',12);
insert into OUTER_SIZE values (145,'M',55,22,46,
69,20,'블랙',12);
insert into OUTER_SIZE values (146,'L',57,24,48,
71,18,'블랙',12);
insert into OUTER_SIZE values (147,'FREE',59,26,50,
73,20,'블랙',13);
insert into OUTER_SIZE values (148,'FREE',59,26,50,
73,17,'네이비',13);
insert into OUTER_SIZE values (149,'FREE',59,26,50,
73,20,'차콜',13);
insert into OUTER_SIZE values (150,'FREE',59,26,50,
73,19,'블랙',14);
insert into OUTER_SIZE values (151,'FREE',59,26,50,
73,20,'네이비',14);
insert into OUTER_SIZE values (152,'FREE',59,26,50,
73,18,'차콜',14);
insert into OUTER_SIZE values (153,'FREE',59,26,50,
73,20,'아이보리',14);
insert into OUTER_SIZE values (154,'FREE',59,26,50,
73,19,'블랙',15);
insert into OUTER_SIZE values (155,'FREE',59,26,50,
73,18,'차콜',15);
insert into OUTER_SIZE values (156,'FREE',59,26,50,
73,20,'블랙',18);
insert into OUTER_SIZE values (157,'FREE',59,26,50,
73,18,'네이비',18);
insert into OUTER_SIZE values (158,'FREE',59,26,50,
73,20,'블랙',19);
insert into OUTER_SIZE values (159,'FREE',59,26,50,
73,20,'네이비',19);
insert into OUTER_SIZE values (160,'FREE',59,26,50,
73,19,'차콜',19);
insert into OUTER_SIZE values (161,'S',53,20,44,
67,20,'블랙',21);
insert into OUTER_SIZE values (162,'M',55,22,46,
69,19,'블랙',21);
insert into OUTER_SIZE values (163,'L',57,24,48,
71,20,'블랙',21);
insert into OUTER_SIZE values (164,'S',53,20,44,
67,20,'차콜',21);
insert into OUTER_SIZE values (165,'M',55,22,46,
69,20,'차콜',21);
insert into OUTER_SIZE values (166,'L',57,24,48,
71,20,'차콜',21);
insert into OUTER_SIZE values (167,'FREE',59,26,50,
73,19,'블랙',22);
insert into OUTER_SIZE values (168,'FREE',59,26,50,
73,20,'차콜',22);
insert into OUTER_SIZE values (169,'FREE',59,26,50,
73,20,'블랙',23);
insert into OUTER_SIZE values (170,'FREE',59,26,50,
73,20,'네이비',23);
insert into OUTER_SIZE values (171,'FREE',59,26,50,
73,20,'화이트',23);
insert into OUTER_SIZE values (172,'FREE',59,26,50,
73,10,'블랙',24);
insert into OUTER_SIZE values (173,'FREE',59,26,50,
73,9,'아이보리',24);
insert into OUTER_SIZE values (174,'FREE',59,26,50,
73,20,'블랙',26);
insert into OUTER_SIZE values (175,'FREE',59,26,50,
73,20,'네이비',26);
insert into OUTER_SIZE values (176,'FREE',59,26,50,
73,18,'차콜',26);
insert into OUTER_SIZE values (177,'FREE',59,26,50,
73,20,'블랙',27);
insert into OUTER_SIZE values (178,'FREE',59,26,50,
73,17,'아이보리',27);
insert into OUTER_SIZE values (179,'FREE',59,26,50,
73,20,'차콜',27);
insert into OUTER_SIZE values (180,'FREE',59,26,50,
73,20,'네이비',27);
insert into OUTER_SIZE values (181,'S',53,20,44,
67,20,'블랙',28);
insert into OUTER_SIZE values (182,'M',55,22,46,
69,19,'블랙',28);
insert into OUTER_SIZE values (183,'L',57,24,48,
71,20,'블랙',28);
insert into OUTER_SIZE values (184,'XL',61,28,52,
75,19,'블랙',28);
insert into OUTER_SIZE values (185,'S',53,20,44,
67,20,'블랙',1);
insert into OUTER_SIZE values (186,'M',55,22,46,
69,20,'블랙',1);
insert into OUTER_SIZE values (187,'L',57,24,48,
71,20,'블랙',1);
insert into OUTER_SIZE values (188,'S',53,20,44,
67,19,'아이보리',1);
insert into OUTER_SIZE values (189,'M',55,22,46,
69,18,'아이보리',1);
insert into OUTER_SIZE values (190,'L',57,24,48,
71,20,'아이보리',1);
insert into OUTER_SIZE values (191,'S',53,20,44,
67,20,'네이비',1);
insert into OUTER_SIZE values (192,'M',55,22,46,
69,20,'네이비',1);
insert into OUTER_SIZE values (193,'L',57,24,48,
71,20,'네이비',1);
insert into OUTER_SIZE values (194,'FREE',59,26,50,
73,20,'블랙',17);
insert into OUTER_SIZE values (195,'FREE',59,26,50,
73,20,'차콜',17);
insert into OUTER_SIZE values (196,'FREE',59,26,50,
73,20,'아이보리',17);
insert into OUTER_SIZE values (197,'S',53,20,44,
67,10,'네이비',25);
insert into OUTER_SIZE values (198,'M',55,22,46,
69,10,'네이비',25);
insert into OUTER_SIZE values (199,'L',57,24,48,
71,10,'네이비',25);
insert into OUTER_SIZE values (200,'XL',61,28,52,
75,10,'네이비',25);
insert into OUTER_SIZE values (201,'S',53,20,44,
67,10,'차콜',25);
insert into OUTER_SIZE values (202,'M',55,22,46,
69,10,'차콜',25);
insert into OUTER_SIZE values (203,'L',57,24,48,
71,10,'차콜',25);
insert into OUTER_SIZE values (204,'XL',61,28,52,
75,10,'차콜',25);
insert into OUTER_SIZE values (205,'S',53,20,44,
67,10,'아이보리',25);
insert into OUTER_SIZE values (206,'M',55,22,46,
69,9,'아이보리',25);
insert into OUTER_SIZE values (207,'L',57,24,48,
71,10,'아이보리',25);
insert into OUTER_SIZE values (208,'XL',61,28,52,
75,10,'아이보리',25);
insert into OUTER_SIZE values (10,'FREE',59,26,50,
73,18,'블랙',2);
insert into OUTER_SIZE values (11,'FREE',59,26,50,
73,15,'화이트',2);
insert into OUTER_SIZE values (12,'FREE',59,26,50,
73,19,'네이비',2);
insert into OUTER_SIZE values (13,'FREE',59,26,50,
73,18,'아이보리',2);
insert into OUTER_SIZE values (25,'FREE',59,26,50,
73,0,'블랙',5);
insert into OUTER_SIZE values (26,'FREE',59,26,50,
73,0,'차콜',5);
insert into OUTER_SIZE values (27,'FREE',59,26,50,
73,0,'네이비',5);
insert into OUTER_SIZE values (46,'FREE',59,26,50,
73,0,'네이비',10);
insert into OUTER_SIZE values (47,'FREE',59,26,50,
73,18,'네이비',11);
insert into OUTER_SIZE values (63,'FREE',59,26,50,
73,0,'블랙',16);
insert into OUTER_SIZE values (64,'FREE',59,26,50,
73,0,'화이트',16);
insert into OUTER_SIZE values (73,'FREE',59,26,50,
73,14,'블랙',20);
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
insert into OUTER_PICTURE values (7,'1531962629727.jpg','D:/DEV/fileUpLoad/image/1531962629727.jpg',7);
insert into OUTER_PICTURE values (1,'1531962092682.jpg','D:/DEV/fileUpLoad/image/1531962092682.jpg',1);
insert into OUTER_PICTURE values (2,'1531962167137.jpg','D:/DEV/fileUpLoad/image/1531962167137.jpg',2);
insert into OUTER_PICTURE values (3,'1531962254634.jpg','D:/DEV/fileUpLoad/image/1531962254634.jpg',3);
insert into OUTER_PICTURE values (4,'1531962368430.jpg','D:/DEV/fileUpLoad/image/1531962368430.jpg',4);
insert into OUTER_PICTURE values (5,'1531962425298.jpg','D:/DEV/fileUpLoad/image/1531962425298.jpg',5);
insert into OUTER_PICTURE values (6,'1531962532645.jpg','D:/DEV/fileUpLoad/image/1531962532645.jpg',6);
insert into OUTER_PICTURE values (8,'1531962721797.jpg','D:/DEV/fileUpLoad/image/1531962721797.jpg',8);
insert into OUTER_PICTURE values (9,'1531962785530.jpg','D:/DEV/fileUpLoad/image/1531962785530.jpg',9);
insert into OUTER_PICTURE values (10,'1531963158024.jpg','D:/DEV/fileUpLoad/image/1531963158024.jpg',10);
insert into OUTER_PICTURE values (12,'1531963683283.jpg','D:/DEV/fileUpLoad/image/1531963683283.jpg',12);
insert into OUTER_PICTURE values (13,'1531963750946.jpg','D:/DEV/fileUpLoad/image/1531963750946.jpg',13);
insert into OUTER_PICTURE values (15,'1531963901503.jpg','D:/DEV/fileUpLoad/image/1531963901503.jpg',15);
insert into OUTER_PICTURE values (19,'1531964533178.jpg','D:/DEV/fileUpLoad/image/1531964533178.jpg',18);
insert into OUTER_PICTURE values (17,'1531963987566.jpg','D:/DEV/fileUpLoad/image/1531963987566.jpg',16);
insert into OUTER_PICTURE values (18,'1531964152400.jpg','D:/DEV/fileUpLoad/image/1531964152400.jpg',17);
insert into OUTER_PICTURE values (20,'1531964600545.jpg','D:/DEV/fileUpLoad/image/1531964600545.jpg',19);
insert into OUTER_PICTURE values (21,'1531964664408.jpg','D:/DEV/fileUpLoad/image/1531964664408.jpg',20);
insert into OUTER_PICTURE values (23,'1531964778443.jpg','D:/DEV/fileUpLoad/image/1531964778443.jpg',22);
insert into OUTER_PICTURE values (24,'1531964851771.jpg','D:/DEV/fileUpLoad/image/1531964851771.jpg',23);
insert into OUTER_PICTURE values (25,'1531964905412.jpg','D:/DEV/fileUpLoad/image/1531964905412.jpg',24);
insert into OUTER_PICTURE values (26,'1531965390997.jpg','D:/DEV/fileUpLoad/image/1531965390997.jpg',25);
insert into OUTER_PICTURE values (27,'1531965478916.jpg','D:/DEV/fileUpLoad/image/1531965478916.jpg',26);
insert into OUTER_PICTURE values (28,'1531965574949.jpg','D:/DEV/fileUpLoad/image/1531965574949.jpg',27);
insert into OUTER_PICTURE values (29,'1531965663034.jpg','D:/DEV/fileUpLoad/image/1531965663034.jpg',28);
insert into OUTER_PICTURE values (11,'1531963210680.jpg','D:/DEV/fileUpLoad/image/1531963210680.jpg',11);
insert into OUTER_PICTURE values (22,'1531964728561.jpg','D:/DEV/fileUpLoad/image/1531964728561.jpg',21);
insert into OUTER_PICTURE values (14,'1531963826354.jpg','D:/DEV/fileUpLoad/image/1531963826354.jpg',14);

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
insert into ORDER_CHECK values (21,'김장규','thumb_1531964569766.png',
'CL 울체크 셔츠자켓',69000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (22,'김장규','thumb_1531963047460.png',
'ML 라이더 자켓',61000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (23,'김장규','thumb_1531963188074.png',
'포인트컬러 데님양털자켓',75000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (24,'김장규','thumb_1531964643900.png',
'UN 올림피아 오리털 롱패딩',139000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (25,'김장규','thumb_1531963633186.png',
'36 인터라켄 트렌치코트',97000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (26,'김장규','thumb_1531964516661.png',
'ES 버닝 후드코트',124000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (27,'홍길동','thumb_1531962228100.png',
'EL Over Check Jacket',66000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (28,'홍길동','thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져',61000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (29,'홍길동','thumb_1531963798489.png',
'FA 더블 롱 오버핏코트',79000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/01/19);
insert into ORDER_CHECK values (30,'홍길동','thumb_1531965633657.png',
'AR 레인지 패딩조끼',29500,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/01/19);
insert into ORDER_CHECK values (31,'홍길동','thumb_1531963047460.png',
'ML 라이더 자켓',61000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/02/19);
insert into ORDER_CHECK values (32,'홍길동','thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져 외1',122000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/02/19);
insert into ORDER_CHECK values (33,'홍길동','thumb_1531962294537.png',
'MC 베크 숏자켓',66000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/03/19);
insert into ORDER_CHECK values (34,'홍길동','thumb_1531963876135.png',
'JD 이탈리 싱글코트',190000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/03/19);
insert into ORDER_CHECK values (35,'홍길동','thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져',61000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (37,'홍길동','thumb_1531962479569.png',
'FA 더블 블레이져',62000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (38,'홍길동','thumb_1531963633186.png',
'36 인터라켄 트렌치코트',97000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (39,'홍길동','thumb_1531962602755.png',
'ET 카리나 셔츠 자켓',59000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/04/18);
insert into ORDER_CHECK values (40,'홍길동','thumb_1531963188074.png',
'포인트컬러 데님양털자켓',75000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/04/18);
insert into ORDER_CHECK values (41,'홍길동','thumb_1531963876135.png',
'JD 이탈리 싱글코트',190000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/04/18);
insert into ORDER_CHECK values (42,'홍길동','thumb_1531962228100.png',
'EL Over Check Jacket',66000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/02/19);
insert into ORDER_CHECK values (43,'홍길동','thumb_1531965538298.png',
'RM 울포켓 가디건 외3',220000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/04/19);
insert into ORDER_CHECK values (45,'김장규','thumb_1531962294537.png',
'MC 베크 숏자켓',66000,'주문취소','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (46,'김장규','thumb_1531964643900.png',
'UN 올림피아 오리털 롱패딩',139000,'결제대기중','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (47,'김장규','thumb_1531963633186.png',
'36 인터라켄 트렌치코트',97000,'결제완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (48,'김장규','thumb_1531963876135.png',
'JD 이탈리 싱글코트',190000,'결제완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (49,'김장규','thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져',61000,'결제대기중','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (50,'김장규','thumb_1531964516661.png',
'ES 버닝 후드코트',124000,'주문취소','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (51,'홍길동','thumb_1531962479569.png',
'FA 더블 블레이져',62000,'결제완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (12,'김장규','thumb_1531962602755.png',
'ET 카리나 셔츠 자켓',59000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (13,'김장규','thumb_1531963047460.png',
'ML 라이더 자켓',61000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (14,'김장규','thumb_1531964882912.png',
'PL 울리치 가디건',51500,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (10,'김장규','thumb_1531962228100.png',
'EL Over Check Jacket 외1',132000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
18/05/18);
insert into ORDER_CHECK values (11,'김장규','thumb_1531962294537.png',
'MC 베크 숏자켓 외4',411000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
18/05/18);
insert into ORDER_CHECK values (15,'김장규','thumb_1531962228100.png',
'EL Over Check Jacket',66000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
18/05/18);
insert into ORDER_CHECK values (52,'홍길동','thumb_1531963798489.png',
'FA 더블 롱 오버핏코트',79000,'결제완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (53,'홍길동','thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져',61000,'배송완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (57,'손흥민','thumb_1531962228100.png',
'EL Over Check Jacket',66000,'주문취소','test3333',
'08716 서울 관악구 국회단지길 6-15 (봉천동, 동아빌라) 303호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (58,'손흥민','thumb_1531965633657.png',
'AR 레인지 패딩조끼',29500,'배송완료','test3333',
'08716 서울 관악구 국회단지길 6-15 (봉천동, 동아빌라) 303호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (59,'손흥민','thumb_1531965303766.png',
'GG 셀링 포인트 가디건',59000,'배송중','test3333',
'08716 서울 관악구 국회단지길 6-15 (봉천동, 동아빌라) 303호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (60,'손흥민','thumb_1531964690977.png',
'AG 그레이 숏패딩',14300,'상품준비중','test3333',
'08716 서울 관악구 국회단지길 6-15 (봉천동, 동아빌라) 303호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (20,'김장규','thumb_1531965538298.png',
'RM 울포켓 가디건',56000,'주문완료','test1234',
'13581 경기 성남시 분당구 수내로 181 (분당동, 샛별마을우방아파트) 312동 1201호','01087791763','jangkuok@naver.com','',
18/06/18);
insert into ORDER_CHECK values (36,'홍길동','thumb_1531962294537.png',
'MC 베크 숏자켓',66000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
18/06/18);
insert into ORDER_CHECK values (44,'홍길동','thumb_1531964643900.png',
'UN 올림피아 오리털 롱패딩 외4',359000,'주문완료','test2222',
'13524 경기 성남시 분당구 대왕판교로606번길 45 (삼평동, 판교역 푸르지오시티) 201호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (54,'손흥민','thumb_1531964764667.png',
'SU 구스패딩 야상',289000,'결제대기중','test3333',
'08716 서울 관악구 국회단지길 6-15 (봉천동, 동아빌라) 303호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (55,'손흥민','thumb_1531962018912.png',
'FR 프링 린넨자켓',51500,'결제완료','test3333',
'08716 서울 관악구 국회단지길 6-15 (봉천동, 동아빌라) 303호','01087791763','jangkuok@naver.com','',
SYSDATE);
insert into ORDER_CHECK values (56,'손흥민','thumb_1531964643900.png',
'UN 올림피아 오리털 롱패딩',139000,'결제대기중','test3333',
'08716 서울 관악구 국회단지길 6-15 (봉천동, 동아빌라) 303호','01087791763','jangkuok@naver.com','',
SYSDATE);
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

insert into ORDER_PRODUCT values (36,19,'thumb_1531964569766.png',
'CL 울체크 셔츠자켓','차콜','FREE',
69000,21);
insert into ORDER_PRODUCT values (37,9,'thumb_1531963047460.png',
'ML 라이더 자켓','블랙','L',
61000,22);
insert into ORDER_PRODUCT values (38,11,'thumb_1531963188074.png',
'포인트컬러 데님양털자켓','네이비','FREE',
75000,23);
insert into ORDER_PRODUCT values (39,20,'thumb_1531964643900.png',
'UN 올림피아 오리털 롱패딩','블랙','FREE',
139000,24);
insert into ORDER_PRODUCT values (40,12,'thumb_1531963633186.png',
'36 인터라켄 트렌치코트','블랙','L',
97000,25);
insert into ORDER_PRODUCT values (41,18,'thumb_1531964516661.png',
'ES 버닝 후드코트','네이비','FREE',
124000,26);
insert into ORDER_PRODUCT values (42,3,'thumb_1531962228100.png',
'EL Over Check Jacket','차콜','FREE',
66000,27);
insert into ORDER_PRODUCT values (43,2,'thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져','화이트','FREE',
61000,28);
insert into ORDER_PRODUCT values (44,14,'thumb_1531963798489.png',
'FA 더블 롱 오버핏코트','차콜','FREE',
79000,29);
insert into ORDER_PRODUCT values (45,28,'thumb_1531965633657.png',
'AR 레인지 패딩조끼','블랙','M',
27000,30);
insert into ORDER_PRODUCT values (46,9,'thumb_1531963047460.png',
'ML 라이더 자켓','블랙','M',
61000,31);
insert into ORDER_PRODUCT values (47,2,'thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져','화이트','FREE',
61000,32);
insert into ORDER_PRODUCT values (48,2,'thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져','블랙','FREE',
61000,32);
insert into ORDER_PRODUCT values (49,4,'thumb_1531962294537.png',
'MC 베크 숏자켓','블랙','M',
66000,33);
insert into ORDER_PRODUCT values (50,15,'thumb_1531963876135.png',
'JD 이탈리 싱글코트','차콜','FREE',
190000,34);
insert into ORDER_PRODUCT values (51,2,'thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져','아이보리','FREE',
61000,35);
insert into ORDER_PRODUCT values (53,6,'thumb_1531962479569.png',
'FA 더블 블레이져','차콜','M',
62000,37);
insert into ORDER_PRODUCT values (54,12,'thumb_1531963633186.png',
'36 인터라켄 트렌치코트','아이보리','S',
97000,38);
insert into ORDER_PRODUCT values (55,7,'thumb_1531962602755.png',
'ET 카리나 셔츠 자켓','차콜','FREE',
59000,39);
insert into ORDER_PRODUCT values (56,11,'thumb_1531963188074.png',
'포인트컬러 데님양털자켓','네이비','FREE',
75000,40);
insert into ORDER_PRODUCT values (57,15,'thumb_1531963876135.png',
'JD 이탈리 싱글코트','차콜','FREE',
190000,41);
insert into ORDER_PRODUCT values (58,3,'thumb_1531962228100.png',
'EL Over Check Jacket','아이보리','FREE',
66000,42);
insert into ORDER_PRODUCT values (59,27,'thumb_1531965538298.png',
'RM 울포켓 가디건','아이보리','FREE',
56000,43);
insert into ORDER_PRODUCT values (60,26,'thumb_1531965441899.png',
'컷팅 오버핏 가디건','차콜','FREE',
49000,43);
insert into ORDER_PRODUCT values (61,4,'thumb_1531962294537.png',
'MC 베크 숏자켓','화이트','M',
66000,43);
insert into ORDER_PRODUCT values (62,1,'thumb_1531962018912.png',
'FR 프링 린넨자켓','아이보리','M',
49000,43);
insert into ORDER_PRODUCT values (68,4,'thumb_1531962294537.png',
'MC 베크 숏자켓','화이트','M',
66000,45);
insert into ORDER_PRODUCT values (69,20,'thumb_1531964643900.png',
'UN 올림피아 오리털 롱패딩','블랙','FREE',
139000,46);
insert into ORDER_PRODUCT values (70,12,'thumb_1531963633186.png',
'36 인터라켄 트렌치코트','블랙','L',
97000,47);
insert into ORDER_PRODUCT values (71,15,'thumb_1531963876135.png',
'JD 이탈리 싱글코트','블랙','FREE',
190000,48);
insert into ORDER_PRODUCT values (72,2,'thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져','화이트','FREE',
61000,49);
insert into ORDER_PRODUCT values (73,18,'thumb_1531964516661.png',
'ES 버닝 후드코트','네이비','FREE',
124000,50);
insert into ORDER_PRODUCT values (74,6,'thumb_1531962479569.png',
'FA 더블 블레이져','차콜','XL',
62000,51);
insert into ORDER_PRODUCT values (75,14,'thumb_1531963798489.png',
'FA 더블 롱 오버핏코트','차콜','FREE',
79000,52);
insert into ORDER_PRODUCT values (76,2,'thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져','네이비','FREE',
61000,53);
insert into ORDER_PRODUCT values (80,3,'thumb_1531962228100.png',
'EL Over Check Jacket','차콜','FREE',
66000,57);
insert into ORDER_PRODUCT values (81,28,'thumb_1531965633657.png',
'AR 레인지 패딩조끼','블랙','XL',
27000,58);
insert into ORDER_PRODUCT values (82,25,'thumb_1531965303766.png',
'GG 셀링 포인트 가디건','아이보리','M',
59000,59);
insert into ORDER_PRODUCT values (83,21,'thumb_1531964690977.png',
'AG 그레이 숏패딩','블랙','M',
11800,60);
insert into ORDER_PRODUCT values (22,4,'thumb_1531962294537.png',
'MC 베크 숏자켓','네이비','M',
66000,11);
insert into ORDER_PRODUCT values (23,4,'thumb_1531962294537.png',
'MC 베크 숏자켓','네이비','S',
66000,11);
insert into ORDER_PRODUCT values (24,14,'thumb_1531963798489.png',
'FA 더블 롱 오버핏코트','블랙','FREE',
79000,11);
insert into ORDER_PRODUCT values (25,2,'thumb_1531962128907.png',
'[AWESOME]BL 시크슈트 블레이져','화이트','FREE',
61000,11);
insert into ORDER_PRODUCT values (26,20,'thumb_1531964643900.png',
'UN 올림피아 오리털 롱패딩','블랙','FREE',
139000,11);
insert into ORDER_PRODUCT values (27,7,'thumb_1531962602755.png',
'ET 카리나 셔츠 자켓','블랙','FREE',
59000,12);
insert into ORDER_PRODUCT values (20,3,'thumb_1531962228100.png',
'EL Over Check Jacket','아이보리','FREE',
66000,10);
insert into ORDER_PRODUCT values (21,3,'thumb_1531962228100.png',
'EL Over Check Jacket','차콜','FREE',
66000,10);
insert into ORDER_PRODUCT values (28,9,'thumb_1531963047460.png',
'ML 라이더 자켓','블랙','S',
61000,13);
insert into ORDER_PRODUCT values (29,24,'thumb_1531964882912.png',
'PL 울리치 가디건','아이보리','FREE',
49000,14);
insert into ORDER_PRODUCT values (30,3,'thumb_1531962228100.png',
'EL Over Check Jacket','아이보리','FREE',
66000,15);
insert into ORDER_PRODUCT values (35,27,'thumb_1531965538298.png',
'RM 울포켓 가디건','아이보리','FREE',
56000,20);
insert into ORDER_PRODUCT values (52,4,'thumb_1531962294537.png',
'MC 베크 숏자켓','블랙','M',
66000,36);
insert into ORDER_PRODUCT values (63,20,'thumb_1531964643900.png',
'UN 올림피아 오리털 롱패딩','블랙','FREE',
139000,44);
insert into ORDER_PRODUCT values (64,27,'thumb_1531965538298.png',
'RM 울포켓 가디건','아이보리','FREE',
56000,44);
insert into ORDER_PRODUCT values (65,26,'thumb_1531965441899.png',
'컷팅 오버핏 가디건','차콜','FREE',
49000,44);
insert into ORDER_PRODUCT values (66,4,'thumb_1531962294537.png',
'MC 베크 숏자켓','화이트','M',
66000,44);
insert into ORDER_PRODUCT values (67,1,'thumb_1531962018912.png',
'FR 프링 린넨자켓','아이보리','M',
49000,44);
insert into ORDER_PRODUCT values (77,22,'thumb_1531964764667.png',
'SU 구스패딩 야상','블랙','FREE',
289000,54);
insert into ORDER_PRODUCT values (78,1,'thumb_1531962018912.png',
'FR 프링 린넨자켓','아이보리','S',
49000,55);
insert into ORDER_PRODUCT values (79,20,'thumb_1531964643900.png',
'UN 올림피아 오리털 롱패딩','블랙','FREE',
139000,56);

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------