package com.outer_shopping.project.service;

import java.util.List;
import java.util.Map;

import com.outer_shopping.project.vo.OuterSizeVo;

public interface OuterSizeService {
	
	void createOuterSize(OuterSizeVo size);
	
	
	void removeOuterSize(int outerNo);
	
	List<Map<String, String>> getSizeList(int outerNo);
	
	List<OuterSizeVo> getListOuterSizeProduct(int outerNo);
	
	List<OuterSizeVo> getListOuterSizeColor(int outerNo, String type);
	
	OuterSizeVo orderProductAmountPlusCnt(int outerNo, String type, String color); 
	
	OuterSizeVo orderProductAmountMinusCnt(int outerNo, String type, String color);
}
