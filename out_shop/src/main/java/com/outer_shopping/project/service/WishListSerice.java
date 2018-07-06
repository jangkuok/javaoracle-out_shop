package com.outer_shopping.project.service;

import java.util.Map;

import com.outer_shopping.project.vo.WishListVo;

public interface WishListSerice {
	
	void createWishList(WishListVo wish);
	
	void removeWishList(int wishNo);
	
	Map<String, Object> getWishList(String memberId,int page);
	
	WishListVo getWishListOverlapped(String memberId,int outerNo);
}
