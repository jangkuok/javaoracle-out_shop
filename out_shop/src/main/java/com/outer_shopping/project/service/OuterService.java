package com.outer_shopping.project.service;

import java.util.List;
import java.util.Map;

import com.outer_shopping.project.vo.OuterVo;

public interface OuterService {
	
	/**
	 * 아웃터 등록
	 * @param outer
	 */
	void createOuter(OuterVo outer);
	
	/**
	 * 아웃터 수정
	 * @param outer
	 */
	void modifyOuter(OuterVo outer);	
	

	/**
	 * 아웃터 삭제
	 * @param outerNo
	 */
	void removeOuter(int outerNo);		
	
	/**
	 * 아웃터 목록
	 * @param outer
	 */
	List<OuterVo> findOuterList();
	

	/**
	 * 카테고리별 아웃터 목록
	 * @param items
	 * @param page
	 * @return
	 */
	Map<String, Object> findItemsOuterList(String items, int page);
	

	
	/**
	 * 아웃터 상세 정보
	 * @param outerId
	 * @return
	 */
	OuterVo getOuter(int outerNo);
	
	
	Map<String, Object> findOuterAmountList(int page);
}
