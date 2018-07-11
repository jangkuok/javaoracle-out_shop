package com.outer_shopping.project.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.outer_shopping.project.dao.ReviewDao;
import com.outer_shopping.project.mapper.ReviewMapper;
import com.outer_shopping.project.vo.ReviewVo;


@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void insertReview(ReviewVo review) {
		try {
			session.getMapper(ReviewMapper.class).insertReview(review);
		}catch (Exception e) {
			System.out.println("insertReview(dao) : ");
			e.printStackTrace();
		}
        
		
	}

	@Override
	public void updateReview(ReviewVo review) {
		try {
			session.getMapper(ReviewMapper.class).updateReview(review);
		}catch (Exception e) {
			System.out.println("updateReview(dao) : ");
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteReview(int reviewNo) {
		try {
			session.getMapper(ReviewMapper.class).deleteReview(reviewNo);
		}catch (Exception e) {
			System.out.println("deleteReview(dao) : ");
			e.printStackTrace();
		}
		
	}
	
	
	@Override
	public int selectReivewListCount() {
		int count = 0;
		
		try {
			count = session.getMapper(ReviewMapper.class).selectReivewListCount();
		}catch (Exception e) {
			System.out.println("selectReivewListCount(dao) : ");
			e.printStackTrace();
		}
		
		return count;
	}
	
	@Override
	public ReviewVo selectReviewNo(int reviewNo) {
		ReviewVo review = new ReviewVo();
		
		try {
			review = session.getMapper(ReviewMapper.class).selectReviewNo(reviewNo);
		}catch (Exception e) {

			System.out.println("selectReviewNo(dao) : ");
			e.printStackTrace();
		}	
		
		return review;
	}

	@Override
	public List<ReviewVo> selectListReview(int startIndex, int endIndex) {
		List<ReviewVo> list = null;
		
		try {			
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("startIndex",startIndex);
			input.put("endIndex",endIndex);
		
			list = session.getMapper(ReviewMapper.class).selectListReview(input);
		}catch (Exception e) {
			System.out.println("selectListReview(dao) : ");
			e.printStackTrace();
		}
		return list;
	}
	

	@Override
	public List<ReviewVo> selectMemberReview(String memberId, int startIndex, int endIndex) {
		
		List<ReviewVo> list = null;
		
		try {			
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("memberId",memberId);
			input.put("startIndex",startIndex);
			input.put("endIndex",endIndex);
		
			list = session.getMapper(ReviewMapper.class).selectMemberReview(input);
		}catch (Exception e) {
			System.out.println("selectMemberReview(dao) : ");
			e.printStackTrace();
		}
		return list;
	}
	
}
