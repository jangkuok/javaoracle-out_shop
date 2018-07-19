package com.outer_shopping.project.dao;

import java.util.List;
import java.util.Map;

import com.outer_shopping.project.vo.OuterSizeVo;

public interface OuterSizeDao {
	
	/**
	 * 사이즈 등록
	 * @param size
	 */
	void insertSize(OuterSizeVo size);
	
	/**
	 * 사이즈 삭제
	 * @param outerNo
	 */
	void deleteOuterSize(int outerNo);
	
	List<Map<String, String>> selectSize(int outerNo);
	
	List<OuterSizeVo> selectOuterSizeProduct(int outerNo);
	
	List<OuterSizeVo> selectListOuterSizeColor(int outerNo,String type);
		
	OuterSizeVo outerSizeAmountPlusCnt(int outerNo, String type, String color); 
	
	OuterSizeVo outerSizeAmountMinusCnt(int outerNo, String type, String color); 
}
