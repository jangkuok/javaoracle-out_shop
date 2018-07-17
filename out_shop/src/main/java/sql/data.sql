select 'insert into OUTER_TB (OUTER_NO, OUTER_TYPE, OUTER_NAME, OUTER_CONTENT, OUTER_PRICE, OUTER_DATE, OUTER_THUMBNAIL_NAME, OUTER_IMAGENAME) 
values ('|| OUTER_NO || ','|| OUTER_TYPE ||',' || OUTER_NAME || ',' || OUTER_CONTENT || ','|| OUTER_PRICE || ',' || OUTER_DATE || ',' || OUTER_THUMBNAIL_NAME || ',' || OUTER_IMAGENAME || ');' 
from OUTER_TB; 

insert into OUTER_TB 
values (1,'자켓','[AWESOME]BL 시크슈트 블레이져','단품으로 따로 추가구입을 원하시는 브로님들의 편의를 위해 블레이져를 따로 진열하였습니다.',61000,SYSDATE,'thumb_1531635867081.png','1531635867081.jpg');
insert into OUTER_TB 
values (2,'코트','GR 카마로 트렌치코트','유니크한 디자인으로 스타일리쉬한 코디룩을 연출하실 수 있는 코트!
',92000,SYSDATE,'thumb_1531636138343.png','1531636138343.jpg');
insert into OUTER_TB 
values (3,'코트','GM 어썸 가운코트 ','완성도를 높이기위해 고급소재를 사용하였으며 매력적인 라인감에 중점을 두어 제작된 코트',145000,SYSDATE,'thumb_1531636276097.png','1531636276097.jpg');
insert into OUTER_TB 
values (4,'코트','FF 후드 더플 롱코트 ','클래식한 멋스러움과 캐쥬얼함이 공존하는 더플코트 (2Color)',102000,SYSDATE,'thumb_1531636385699.png','1531636385699.jpg');
insert into OUTER_TB 
values (5,'자켓','TC 빈티지 배색점퍼 ','컬러배색도 이쁘고 디자인도 이쁘고 라인감도 이쁜 점퍼에요 !',53000,SYSDATE,'thumb_1531636511706.png','1531636511706.jpg');
insert into OUTER_TB 
values (6,'자켓','ET 카리나 셔츠 자켓 ','셔츠디자인과 자켓디자인을 믹스하여 조금더 유니크하고 멋스러운 디자인으로 제작된 셔츠자켓이에요. 두께감도 일반 자켓보다 더 있어서 보온성도 좋은 녀석이에요',59000,SYSDATE,'thumb_1531636608807.png','1531636608807.jpg');
insert into OUTER_TB 
values (7,'가디건','SU 비 루즈핏 가디건 ','컬러감이 정말 이쁜 가디건이에요. 사이즈도 루즈하게 떨어져서 핏감도 무지 이쁜제품이구요',30000,SYSDATE,'thumb_1531636712211.png','1531636712211.jpg');
insert into OUTER_TB 
values (8,'가디건','GG 셀링 포인트 가디건 ','소매와 밑단부분에 배색컬러감으로 디자인된 울 가디건 (3Color)',59000,SYSDATE,'thumb_1531636793371.png','1531636793371.jpg');
insert into OUTER_TB 
values (9,'가디건','[AWESOME] FA 라벨 루즈핏 가디건 ','[바이흰티 첫번째 AWESOME LINE]귀여운 빅포켓으로 디자인되고 오버사이즈로 스타일있게 코디해보실 수 있는 가디건이에요. 두께감도 적당해서 봄.가을.겨울 모두 입으실 수 있고 부담없는 디자인으로 오래 입으실 수 있는 소장가치 높은! 가디건이에요.',19000,SYSDATE,'thumb_1531636870654.png','1531636870654.jpg');
insert into OUTER_TB 
values (10,'패딩','AU 라쿤 오버 야상 ','오리털과웰론 충전재로 보온성과 경량함을 더하여 제작된 빈티지라쿤야상 ',119000,SYSDATE,'thumb_1531637011864.png','1531637011864.jpg');
insert into OUTER_TB 
values (11,'패딩','RM 셀럽 숏패딩 ','소프트 오버핏으로 디자인된 숏패딩으로 덕다운 충전재로 보온성이 높은 제품 ',107000,SYSDATE,'thumb_1531637113992.png','1531637113992.jpg');
insert into OUTER_TB 
values (12,'패딩','SU 구스패딩 야상 ','100% 구스 충전재를 사용하여 푹신한 느낌과 빠른 복원력 그리고 높은 보온성을 자랑하며 풍성한 오리지널 라쿤을 사용하여 고급스러움을 더한 오버핏의 패딩야상 (2Color)',289000,SYSDATE,'thumb_1531637219177.png','1531637219177.jpg');
insert into OUTER_TB 
values (13,'자켓','DN 스마일 패치야상 ','위트있는 디자인의 야상이에요!',66000,SYSDATE,'thumb_1531637339079.png','1531637339079.jpg');
insert into OUTER_TB 
values (14,'조끼','BS 경량 패딩조끼 ','간편하게 소지할 수 도 있고 보온성도 좋게 나오고 가격도 좋은! 패딩조끼에요',14000,SYSDATE,'thumb_1531637443108.png','1531637443108.jpg');
insert into OUTER_TB 
values (15,'자켓','MC 베크 숏자켓',' 깔끔한 룩을 원한다면 추천드리는 자켓이에요!! 디자인이 심플해서 어떤옷에도 다잘어올려요!',66000,SYSDATE,'thumb_1531637595551.png','1531637595551.jpg');
insert into OUTER_TB 
values (16,'코트','AT 체크 펄펙 오버코트','완성도 높은 오버핏감과 감각적인 패턴으로 제작된 오버코트 (2Color)',89000,SYSDATE,'thumb_1531639978956.png','1531639978956.jpg');
insert into OUTER_TB 
values (17,'코트','MV 떡볶이코트','추운겨울에도 착용해보실 수 있도록 압축솜과 퀄팅공법으로 제작된 더플코트',49000,SYSDATE,'thumb_1531640147889.png','1531640147889.jpg');
insert into OUTER_TB 
values (18,'코트','더블 오버핏 롱코트','스타일리쉬한 디자인과 트랜디한 오버핏라인감으로 제작된 롱코트',91000,SYSDATE,'thumb_1531640229529.png','1531640229529.jpg');
insert into OUTER_TB 
values (19,'자켓','ML 라이더 자켓','가장 베이직한 스타일에 견고함을 더하여 제작된 라이더자켓!',61000,SYSDATE,'thumb_1531640539602.png','1531640539602.jpg');
insert into OUTER_TB 
values (20,'자켓','EL Over Check Jacket','오버핏의 스타일리쉬함으로 연출하실 수 있는 자켓이에요',66000,SYSDATE,'thumb_1531640621636.png','1531640621636.jpg');
insert into OUTER_TB 
values (21,'자켓','CO047 후드 청자켓','쉽게 찾아보실 수 없는 유니크함이 느껴지는 귀여운 데님 후드 청자켓이에요!',49000,SYSDATE,'thumb_1531640728770.png','1531640728770.jpg');
insert into OUTER_TB 
values (22,'패딩','GC 바버 양털자켓','클래식함이 묻어나는 디자인으로 섬세한 디테일이 살아있는 자켓',109000,SYSDATE,'thumb_1531640827686.png','1531640827686.jpg');
insert into OUTER_TB 
values (23,'자켓','FA 사파리 숏자켓','깔끔하지만 스타일리쉬한 디자인으로 제작된 체크패딩',77000,SYSDATE,'thumb_1531640906910.png','1531640906910.jpg');
insert into OUTER_TB 
values (24,'패딩','TG 스팟 양털패딩','보기에도 따뜻함이 느껴지는 디자인으로 디자인된 양털패딩',62000,SYSDATE,'thumb_1531641074564.png','1531641074564.jpg');
insert into OUTER_TB 
values (25,'패딩','IC 후드 롱패딩','롱한 기장감과 후드까지 더해진 따뜻한 롱패딩 (4Color)',98000,SYSDATE,'thumb_1531641299895.png','1531641299895.jpg');
insert into OUTER_TB 
values (26,'패딩','GB 벙커 덕다운 라쿤야상','오버핏으로 코트등과도 잘어울리는 제품으로 덕다운과 리얼라쿤으로 이루어',206000,SYSDATE,'thumb_1531641371423.png','1531641371423.jpg');
insert into OUTER_TB 
values (27,'코트','MT 체크 떡볶이 코트','매력적인 컬러감으로 심플한 룩에도 포인트있는 코디연출감을 보여주는 데플',112000,SYSDATE,'thumb_1531641685265.png','1531641685265.jpg');
insert into OUTER_TB 
values (28,'코트','SU 마르니 오버코트','더블버튼으로 디자인된 소프트 오버핏의 더블코트 (3Color)',96000,SYSDATE,'thumb_1531641743483.png','1531641743483.jpg');
insert into OUTER_TB 
values (29,'코트','JD 이탈리 싱글코트','적당한 두께감과 울소재감으로 보온성도 있으면서 라인감까지 살려서 제작된 코트 ',190000,SYSDATE,'thumb_1531641832590.png','1531641832590.jpg');
insert into OUTER_TB 
values (30,'패딩','UN 올림피아 오리털 롱패딩','어떤곳에서도 찾아보시기 힘든 롱한 기장감과 100% 오리털 충전재로 제작된 완성도높은
',139000,SYSDATE,'thumb_1531642110033.png','1531642110033.jpg');
insert into OUTER_TB 
values (31,'패딩','BS 베스트 롱패딩','누구나 즐기실 수 있도록 제작된 퀄리티높은 롱패딩!! 300개한정 특가판매!!',54000,SYSDATE,'thumb_1531642236493.png','1531642236493.jpg');
insert into OUTER_TB 
values (32,'가디건','컷팅 오버핏 가디건','매력적인 디자인으로 제작된 오버핏의 니트 가디건',49000,SYSDATE,'thumb_1531745208657.png','1531745208657.jpg');