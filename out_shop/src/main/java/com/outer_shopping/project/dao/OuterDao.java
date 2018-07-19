package com.outer_shopping.project.dao;

import java.util.List;
import java.util.Map;

import com.outer_shopping.project.vo.OuterVo;

public interface OuterDao {
	
	/**
	 * 아웃터 생성
	 * @param outer
	 */
	void insertOuter(OuterVo outer);
	
	/**
	 * 아웃터 수정
	 * @param outer
	 */
	void updateOuter(OuterVo outer);	
	
	/**
	 * 아웃터 삭제
	 * @param outerNo
	 */
	void deleteOuter(int outerNo);	
	
	/**
	 * 아웃터 목록 카운트
	 * @return
	 */
	int selectOuterListCount();
	
	/**
	 * 아웃터 목록 카운트
	 * @return
	 */
	int selectOuterListCount(String items);
	
	/**
	 * 아웃터 목록
	 */
	List<OuterVo> selectListOuter();
	
	/**
	 * 카테고리별 상품 목록
	 * @param items
	 * @param startIndex
	 * @param endIndex
	 * @return
	 */
	List<OuterVo> selectItemsOuterList(String items,int startIndex, int endIndex);
	
		
	/**
	 * 아웃터 상세 정보
	 * @param outerId
	 * @return
	 */
	OuterVo selectOuterId(int outerNo);
	
	/**
	 * 아웃터 수량 확인
	 * @param startIndex
	 * @param endIndex
	 * @return
	 */
	List<OuterVo> selectOuterAmountList(int startIndex, int endIndex);
}
