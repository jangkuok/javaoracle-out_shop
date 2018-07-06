package com.outer_shopping.project.dao;

import java.util.List;

import com.outer_shopping.project.vo.WishListVo;

public interface WishListDao {
	
	/**
	 * 관심상품 등록
	 * @param wish
	 */
	void insertWishList(WishListVo wish);
	
	/**
	 * 관심상품 삭제
	 */
	void deleteWishList(int wishNo);
	
	/**
	 * 글 목록 전체 갯수
	 * @return
	 */
	int selectWishListCount();
	
	/**
	 * 회원 관심상품 목록
	 * @param memberId
	 * @return
	 */
	List<WishListVo> selectWishList(String memberId,int startIndex, int endIndex);
	
	
	/**
	 * 관심상품 중복확인
	 * @param memberId
	 * @return
	 */
	WishListVo selectWishListOverlapped(String memberId,int outerNo);
}
