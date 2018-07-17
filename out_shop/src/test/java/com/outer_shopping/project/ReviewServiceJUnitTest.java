package com.outer_shopping.project;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.outer_shopping.project.dao.ReviewDao;
import com.outer_shopping.project.service.ReviewService;
import com.outer_shopping.project.service.WishListSerice;
import com.outer_shopping.project.vo.WishListVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/root-context.xml"
      })

public class ReviewServiceJUnitTest {
	
	private static final Logger log	= LoggerFactory.getLogger(ReviewServiceJUnitTest.class);


	@Autowired
	private ReviewService service;
	
	
 	/**
 	 * 별점 평균 TEST
 	 */
	@Test
	public void starAvgTest(){
		log.info("######### JUnit(starAvgTest) 테스트 ##############");
		
		Map<String, Object> map = service.getReviewStarAvg(22);
		
		System.out.println(map.get("AVG"));
		System.out.println(map.get("OUTER_NO"));

	}


 	
}
