package com.outer_shopping.project.dao;


import java.util.List;

import com.outer_shopping.project.vo.ReviewVo;


public interface ReviewDao {
	
	void insertReview(ReviewVo review);
	
    void updateReview(ReviewVo review);
    
    void deleteReview(int reviewNo);
    
    int selectReivewListCount();
    
    List<ReviewVo> selectListReview(int startIndex,int endIndex);
    
    List<ReviewVo> selectMemberReview(String memberId, int startIndex, int endIndex);
}
