package com.outer_shopping.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outer_shopping.project.dao.ReviewDao;
import com.outer_shopping.project.service.ReviewService;
import com.outer_shopping.project.util.PagingBean;
import com.outer_shopping.project.vo.ReviewVo;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public void createReview(ReviewVo review) {
		try {
			reviewDao.insertReview(review);
		}catch (Exception e) {
			System.out.println("createReview(service) : ");
			e.printStackTrace();
		}
	}

	@Override
	public void modifyReview(ReviewVo review) {
		try {
			reviewDao.updateReview(review);
		}catch (Exception e) {
			System.out.println("modifyReview(service) : ");
			e.printStackTrace();
		}
		
	}

	@Override
	public void removeReview(int reviewNo) {
		try {
			reviewDao.deleteReview(reviewNo);
		}catch (Exception e) {
			System.out.println("removeReview(service) : ");
			e.printStackTrace();
		}
		
	}

	@Override
	public Map<String, Object> getListReview(int page) {
		List<ReviewVo> list = null;
		 
		HashMap<String, Object> map = new HashMap<>();
		try {
			int totalCount = reviewDao.selectReivewListCount();
			PagingBean pageBean = new PagingBean(totalCount, page);
			map.put("pageBean", pageBean);
			list = reviewDao.selectListReview(pageBean.getBeginItemInPage(), pageBean.getEndItemInPage());
			map.put("list", list);
			
		}catch (Exception e) {
			System.out.println("getListReview(service) : ");
			e.printStackTrace();
		}
		
		return map;
	}

	@Override
	public Map<String, Object> getMemberReview(String memberId,int page) {
		List<ReviewVo> list = null;
		 
		HashMap<String, Object> map = new HashMap<>();
		try {
			int totalCount = reviewDao.selectReivewListCount();
			PagingBean pageBean = new PagingBean(totalCount, page);
			map.put("pageBean", pageBean);
			list = reviewDao.selectMemberReview(memberId,pageBean.getBeginItemInPage(), pageBean.getEndItemInPage());
			map.put("list", list);
			
		}catch (Exception e) {
			System.out.println("getMemberReview(service) : ");
			e.printStackTrace();
		}
		
		return map;
	}

}
