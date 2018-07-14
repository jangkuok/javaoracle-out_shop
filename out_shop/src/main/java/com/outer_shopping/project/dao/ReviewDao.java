package com.outer_shopping.project.dao;


import java.util.List;
import java.util.Map;

import com.outer_shopping.project.vo.OuterVo;
import com.outer_shopping.project.vo.ReviewVo;


public interface ReviewDao {
	
	void insertReview(ReviewVo review);
	
    void updateReview(ReviewVo review);
    
    void deleteReview(int reviewNo);
    
    int selectReivewListCount();
    
    int selectReivewMemberIdListCount(String memberId);
    
    ReviewVo selectReviewNo(int reviewNo);
    
    Map<String, Object> selectReviewStarAvg(int outerNo);
    
    List<ReviewVo> selectListReview(int startIndex,int endIndex);
    
    List<ReviewVo> selectMemberReview(String memberId, int startIndex, int endIndex);
    
    List<OuterVo> selectOuterNoReview(int outerNo, int startIndex, int endIndex);
}
