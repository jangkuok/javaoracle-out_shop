package com.outer_shopping.project.service;

import java.util.List;
import java.util.Map;

import com.outer_shopping.project.vo.ReviewVo;


public interface ReviewService {
	
	void createReview(ReviewVo review);
	
    void modifyReview(ReviewVo review);
    
    void removeReview(int reviewNo);
    
    Map<String, Object> getReviewStarAvg(int outerNo);
    
    ReviewVo getReviewNo(int reviewNo);
    
    Map<String, Object> getListReview(int page);
    
    Map<String, Object> getMemberReview(String memberId,int page);
    
    Map<String, Object> getOuterNoReview(int outerNo,int page);
}
