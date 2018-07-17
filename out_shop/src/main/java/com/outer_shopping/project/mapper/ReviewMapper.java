package com.outer_shopping.project.mapper;

import java.util.List;
import java.util.Map;

import com.outer_shopping.project.vo.OuterVo;
import com.outer_shopping.project.vo.ReviewVo;

public interface ReviewMapper {
	
	void insertReview(ReviewVo review);
	
    void updateReview(ReviewVo review);
    
    void deleteReview(int reviewNo);
    
    int selectReivewListCount();
    
    int selectReivewMemberIdListCount(String memberId);
    
    Map<String, Object> selectReviewStarAvg(int outerNo);
    
    ReviewVo selectReviewNo(int reviewNo);
    
    List<ReviewVo> selectListReview(Map<String, Object> map);
    
    List<ReviewVo> selectMemberReview(Map<String, Object> map);
}
