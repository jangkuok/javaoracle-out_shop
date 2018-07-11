package com.outer_shopping.project.dao;


import java.util.List;
import java.util.Map;

import com.outer_shopping.project.vo.OrderCheckVo;
import com.outer_shopping.project.vo.OrderProductVo;

public interface OrderProductDao {
	/**
	 * 주문 등록
	 * @param check
	 */
	void insertOrderCheck(OrderCheckVo check);
	
	/**
	 * 주문한 상품 등록
	 * @param product
	 */
	void insertOrderProduct(OrderProductVo product);
	
	
	/**
	 * 주문 상태 수정
	 * @param orderNo
	 */
	void handingUpdateOrder(int orderNo,String handing);
	
	/**
	 * 전체 리스트 카운트
	 * @return
	 */
	int selectOrderListCount();
	
	/**
	 * 전체 주문 목록
	 * @param startIndex
	 * @param endIndex
	 * @return
	 */
	List<OrderCheckVo> selectOrderList(String items, int startIndex, int endIndex);
	
	/**
	 * 해당 회원 주문 목록
	 * @param memberId, items, startIndex, endIndex
	 * @return
	 */
	List<OrderCheckVo> selectMemberOrderList(String memberId, String items, int startIndex, int endIndex); 
	
	/**
	 * 주문 관련 상품 목록 
	 * @param orderId
	 * @return
	 */
	List<OrderProductVo> selectOrderProductList(int orderId);
	
	
	List<OrderProductVo> selectTopThreeList();
	
	List<Map<String, Object>> selectMonthProduct();
	
	List<Map<String, Object>> selectYearProduct();
	
}
