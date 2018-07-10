package com.outer_shopping.project.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.outer_shopping.project.dao.WishListDao;
import com.outer_shopping.project.mapper.WishListMapper;
import com.outer_shopping.project.vo.WishListVo;

@Repository
public class WishListDaoImpl implements WishListDao {
	
	@Autowired
	private SqlSession session;


	/**
	 * 관심상품 등록
	 */
	@Override
	public void insertWishList(WishListVo wish) {
		try {		
			session.getMapper(WishListMapper.class).insertWishList(wish);
		}catch (Exception e) {
			System.out.println("insertWishList(dao) : ");
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 관심상품 삭제
	 */
	@Override
	public void deleteWishList(int wishNo) {
		try {
			session.getMapper(WishListMapper.class).deleteWishList(wishNo);
		}catch (Exception e) {
			System.out.println("deleteWishList(dao) : ");
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 글전체 목록 수
	 */
	@Override
	public int selectWishListCount() {
		return session.getMapper(WishListMapper.class).selectWishListCount();
	}


	/**
	 * 회원 관심상품 목록
	 */
	@Override
	public List<WishListVo> selectWishList(String memberId,int startIndex, int endIndex) {
		
		List<WishListVo> list = null;
		
		try {			
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("memberId",memberId);
			input.put("startIndex",startIndex);
			input.put("endIndex",endIndex);
		
			list = session.getMapper(WishListMapper.class).selectWishList(input);
		}catch (Exception e) {
			System.out.println("selectWishList(dao) : ");
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 회원 관심상품 중복확인
	 */
	@Override
	public WishListVo selectWishListOverlapped(String memberId, int outerNo) {
		
		WishListVo wishList = new WishListVo();
		
		Map<String, Object> input = new HashMap<String, Object>();
		input.put("memberId",memberId);
		input.put("outerNo",outerNo);
		
		try {
			wishList = session.getMapper(WishListMapper.class).selectWishListOverlapped(input);
		}catch (Exception e) {
			System.out.println("selectWishListOverlapped(dao) : ");
			e.printStackTrace();
		}		
		
		return wishList;
	}
	
	
}
