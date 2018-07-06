package com.outer_shopping.project.mapper;

import java.util.List;
import java.util.Map;

import com.outer_shopping.project.vo.WishListVo;

public interface WishListMapper {
	
	void insertWishList(WishListVo wishListVo);
	
	void deleteWishList(int wishNo);
	 
	int selectWishListCount();
	 
	List<WishListVo> selectWishList(Map<String, Object> input);
	
	WishListVo selectWishListOverlapped(Map<String, Object> input);
}
